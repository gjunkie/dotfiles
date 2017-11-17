Vim�UnDo� �,Y��D>����c)WأE&��ƇbJ���  v                                  X��J    _�                     �       ����                                                                                                                                                                                                                                                                                                                            �          �          V       X��Y     �   �   �  m      		  �   �   �  l    5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �          �          V       X��d     �   �   �  m      			@post.push_update5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �          �          V       X��v     �   �   �  m      2			@post.push_update unless @newly_duplicated_post5�_�                    �   .    ����                                                                                                                                                                                                                                                                                                                            �          �          V       X��y    �   �   �  m      .			@post.push_update if @newly_duplicated_post5�_�                    �        ����                                                                                                                                                                                                                                                                                                                                                             X��I     �              m   #rubocop:disable all   ?class Moments::PostsController < Moments::ApplicationController       	before_filter :get_settings   �	before_filter :get_initial_data, if: Proc.new { |c| (c.action_name == "index" || c.action_name == "show") && request.format == :html }   Q	before_filter :check_incoming_sms, if: lambda { params[:incoming_sms].present? }   	before_filter :set_moment   E	before_filter :set_checkpointable, only: [:checkpoints, :checkpoint]   N	before_filter :set_notable, only: [:create_note, :update_note, :destroy_note]   �	skip_before_filter :check_subdomain, :show_roadblock, :check_login, :new_opal_setup_viewed, :get_settings, :get_initial_data, :set_moment, if: lambda { params[:incoming_email].present? || params[:incoming_sms].present? }       	# Run after before_filters   7	include Moments::Approvals::ApprovalPhaseGroupCreation   !	include Moments::ContentDelivery   	include CheckpointHandler   	include NotableHandler       	respond_to :html, :json       
	def index   		@posts = @moment.posts       L		respond_with(@posts, layout: request.xhr? ? false : "primary") do |format|   			format.json do   %        privacy_serialization(@posts)   			end   			format.html do    				redirect_to_moments(@moment)   			end   		end   	end       		def show   M		# If coming from an activity-related route, fix the context for params[:id]   4		params[:id] = params[:post_id] if params[:post_id]       -		post = @moment.posts.where(id: params[:id])   		.eager_load_components   		.first   		if post.present?   			@post = post   M		else # the post may have been moved lets try other moments the user can see   0			post = Moments::Post.find_by(id: params[:id])   B			if post && post.moment.visible_for_user(@brand, @user).present?   ,				redirect_to post.view_in_opal and return   			end   		end       
		if @post   			@page_title = @post.name       L			respond_with(@post, layout: request.xhr? ? false : "primary") do |format|   ,				format.json { json_for_resource(@post) }   				format.html   &        format.csv { stream_csv_file }   			end   		else   			redirect_to_moments(@moment)   		end   	end       	def create   8		return signal_json_error(as_http: true) unless @moment       		@post = @moment.posts.new       @		links_with_data_set = params[:post].has_key?(:links_with_data)   :		links_with_data = params[:post].delete(:links_with_data)       		# Set User   		@post.user = @user       		# Parse post options   5		@post_options = params[:post].delete(:post_options)       -		# Remove localization attributes if missing   4		if params[:post]["localization_attributes"].blank?   2			params[:post].delete("localization_attributes")   		end       '		# Set approver phase group attributes   2		parse_approval_phase_group(@post, params[:post])       		# Setup delivery record   n		if params[:post][:delivery_record_attributes] && params[:post][:delivery_record_attributes][:record_id].nil?   M			@delivery_record_attrs = params[:post].delete(:delivery_record_attributes)   		end       Z		privacy_group_helper = Privacy::GroupControllerHelper.new(entity: @post, params: params)   "		@post.attributes = params[:post]       		# Set Service   [		@post.service ||= Moments::Service.where(id: params[:post][:service_id]).first rescue nil   4		@post.service ||= @post.account.service rescue nil       >    # Don't allow post creation for a service with no accounts   @    unless @post.service&.accounts.for_brand(@brand.id).present?   -      return signal_json_error(as_http: true)       end       		# Set Account   		unless @post.account   *			account_id = params[:post][:account_id]   e			account = Moments::Account.for_user(brand_id: @brand.id, user_id: @user.id).find_by_id(account_id)       2			if account && account.open_or_member_of?(@user)   				@post.account = account   			end   		end       		# Setup label associations   		if params[:post][:labels]   F			label_ids = params[:post][:labels].map { |label_id| label_id.to_i }       B			labels = Moments::Label.for_opal_or_brand(@opal.id, @brand.id).   1				where("moments_labels.id IN (?)", label_ids).   M				order("FIELD(moments_labels.id, VARIADIC ARRAY[#{label_ids.join(",")}])")   			labels.each do |label|   /				@post.label_posts.build(label_id: label.id)   			end   		end       I		# Before saving, disable push as we want to wait until the associations   +		# are established before pushing the post   		@moment.stop_push   		@post.stop_push       		if @post.save   -      privacy_group_helper.update_membership!       %			# Create delivery record if needed   			if @delivery_record_attrs   i				@delivery_record_attrs.delete("publishing_mode") # This is temporary until post updates its own state   A				@post.delivery_record&.update_columns(@delivery_record_attrs)   			end       P      # Determine the creation activity item based on the post being a duplicate   ,      # (from this moment or another) or not   �      if (origin_moment_id = params[:post][:duplicated_from_moment_id]) && @moment.id != params[:post][:duplicated_from_moment_id]   T        if origin_moment_brand_id = Moments::Moment.find(origin_moment_id)&.brand_id   �          if origin_moment = Moments::Moment.for_user(brand_id: origin_moment_brand_id, user_id: @user.id, from_bridge: @from_bridge).find_by_id(origin_moment_id)   d            if origin_post = origin_moment.posts.find_by_id(params[:post][:duplicated_from_post_id])   5              activity_verb = "duplicate_from_moment"   $              activity_meta_data = {   1                brand_id: origin_moment_brand_id,   ,                moment_id: origin_moment.id,   2                moment_title: origin_moment.title,   (                post_id: origin_post.id,   +                post_name: origin_post.name                 }               end             end           end   3      elsif params[:post][:duplicated_from_post_id]   '        # Clone longform content blocks   0        if @post.post_type&.to_sym == :long_form   *          Moments::LongformDuplicator.new(   G            source_content_id: params[:post][:duplicated_from_post_id],   '            target_content_id: @post.id             ).duplicate_content!   +          @post = Moments::Post.find(@post)   !		  @newly_duplicated_post = true           end       Z        if origin_post = @moment.posts.find_by_id(params[:post][:duplicated_from_post_id])   %          activity_verb = "duplicate"              activity_meta_data = {   "              brand_id: @brand.id,   &              post_id: origin_post.id,   )              post_name: origin_post.name             }           end   	      end       			# Create activity record          activity_verb ||= "create"         activity_meta_data ||= {}       			save_activity(object: @post,   :            type: { object: "post", verb: activity_verb },   *            meta_data: activity_meta_data,   3						application_id: @current_opal_application.id)       X      # Flag post to wipe publishing_related options ONLY if the account_id had changed.   9      # https://workwithopal.atlassian.net/browse/SUP-577   j      skip_parsing_publishing_options = origin_post.present? && @post.account_id != origin_post.account_id       $      # Save associated post options   g      Moments::PostOptionParser.new(@post, @post_options, @user, skip_parsing_publishing_options).parse             # Set any passed assets   T      asset_references        = params[:post][:asset_reference_posts].to_a rescue []   Z      @post.set_asset_references(references: asset_references, user: @user, brand: @brand)       			# Save links   A			@post.set_links(links_with_data, @user) if links_with_data_set       ,			# Ensure the approval counts are accurate   &			@post.update_approval_counter_cache       /      # Add creator members association on post   5      @post.add_member(user: @user, opal: @post.opal)       5			# Update cache with associations and push the post   			@moment.start_push   			@post.start_push   6			@post.push_update if @newly_duplicated_post != true       			# Create subscriptions   A			@user.subscriptions.where(subscribable: @post).first_or_create       8			# Pull the record back out so it has its associations   6			@post = Moments::Post.unscoped.find_by_id(@post.id)       1			respond_with(@post, layout: false) do |format|   ,				format.json { json_for_resource(@post) }   			end   		else   5			respond_with(@post, status: :unprocessable_entity)   		end   	end       	def update   ?		handle_update_from_email_or_sms if @valid_email || @valid_sms       0    @post = @moment.posts.where(id: params[:id])         .eager_load_components         .eager_load_privacy         .eager_load_apg         .first   6		return signal_json_error(as_http: true) unless @post       \    privacy_group_helper = Privacy::GroupControllerHelper.new(entity: @post, params: params)       @		links_with_data_set = params[:post].has_key?(:links_with_data)   :		links_with_data = params[:post].delete(:links_with_data)       5		if links_with_data_set && !links_with_data.present?   			@post.links.destroy_all   		end       V    # Flag post to wipe publishing_related options ONLY if the account_id had changed.   7    # https://workwithopal.atlassian.net/browse/SUP-577   {    skip_parsing_publishing_options = params[:post].has_key?(:account_id) && @post.account_id != params[:post][:account_id]       		# Setup account association   Z		if params[:post].has_key?(:account_id) && @post.account_id != params[:post][:account_id]   *			account_id = params[:post][:account_id]   e			account = Moments::Account.for_user(brand_id: @brand.id, user_id: @user.id).find_by_id(account_id)       2			if account && account.open_or_member_of?(@user)   M				# This is a temporary fix to ensure the account is set on the post before   L				# other methods go to look for it through polymorphic associations. When   L				# these type of lookups occur, unsaved attributes on a model are not yet   				# available   				if account   +					original_account_id = @post.account_id   1					@post.update_column(:account_id, account.id)   				end   			end   		end       '		# Set approver phase group attributes   2		parse_approval_phase_group(@post, params[:post])       		# Parse post options   5		@post_options = params[:post].delete(:post_options)       -		# Remove localization attributes if missing   4		if params[:post]["localization_attributes"].blank?   2			params[:post].delete("localization_attributes")   		end       5		# Remote empty post_type_data to retain legacy data   -		params[:post].try(:delete, :post_type_data)       "		@post.attributes = params[:post]       +		# Pass through which user saved this post   I		@post.saved_by_user_name = @user.full_name if params[:post][:user_save]       '		# Move the post to a different moment   &		if params[:post][:move_to_moment_id]   			# Find moment   �      move_to_moment = Moments::Moment.for_user_with_privacy(brand_id: @brand.id, user_id: @user.id, from_bridge: @from_bridge).   4		    find_by(id: params[:post][:move_to_moment_id])   @			return signal_json_error(as_http: true) unless move_to_moment       			# Set moment   @			post_mover = Moments::PostMovement.new(@post, move_to_moment)   			post_mover.move   		end       		# Setup label associations   $		if params[:post].has_key?(:labels)   			@post.labels.clear       			if params[:post][:labels]   G				label_ids = params[:post][:labels].map { |label_id| label_id.to_i }       N        @post.labels << Moments::Label.for_opal_or_brand(@opal.id, @brand.id).   7          where("moments_labels.id IN (?)", label_ids).   S          order("FIELD(moments_labels.id, VARIADIC ARRAY[#{label_ids.join(",")}])")   	      end       end       K    # Before saving, disable push as we want to wait until the associations   -    # are established before pushing the post       @post.stop_push       		if @post.save   !			# Save associated post options   �      Moments::PostOptionParser.new(@post, @post_options, @user, skip_parsing_publishing_options).parse unless post_mover.present?   -      privacy_group_helper.update_membership!       			activity_created = false   4			if params[:post][:asset_reference_posts].present?   				# Set any passed assets   A				asset_references = params[:post][:asset_reference_posts].to_a   \        @post.set_asset_references(references: asset_references, user: @user, brand: @brand)   Y			elsif @post.asset_references.exists? && params[:post].has_key?(:asset_reference_posts)   )				# delete any current asset references   N        @post.set_asset_references(references: [], brand: @brand, user: @user)   			end       			# Save links   ]			@post.set_links(links_with_data, @user) if links_with_data_set && links_with_data.present?       ,			# Ensure the approval counts are accurate   &			@post.update_approval_counter_cache       4			# Handle delivery record update on account change   			if account.present?   F				# Once we can rely on the Post#set_delivery_record callback to run   I				# when the account_id update is no longer silently handled outside of   K				# the primary post save, this manual call to update the delivery record   				# can be removed   v				@post.delivery_record&.update_from_account_change(old_account_id: original_account_id, new_account_id: account_id)   			end       C			# Reflect the post's changes in the publishing queue, unless the   7			# publishing status is being changed in this request   7			if params[:post].has_key?(:update_publishing_status)   >				if params[:post][:manually_publish] && @post.is_published?   					activity_created = true   !					save_activity(object: @post,   ;								type: { object: "post", verb: "manually_publish" },   5								application_id: @current_opal_application.id)   E				elsif params[:post][:sent_for_publishing] && !@post.is_published?   					activity_created = true   !					save_activity(object: @post,   ;								type: { object: "post", verb: "manually_publish" },   5								application_id: @current_opal_application.id)   B				elsif params[:post][:manually_publish] && !@post.is_published?   					activity_created = true   !					save_activity(object: @post,   =								type: { object: "post", verb: "retract_publishing" },   5								application_id: @current_opal_application.id)   2				elsif !params[:post][:is_publishing_held].nil?   *					if params[:post][:is_publishing_held]   .						@post.set_publishing_held_by_user(@user)       						activity_created = true   "						save_activity(object: @post,   ;									type: { object: "post", verb: "hold_publishing" },   ?									comment: params[:post][:post_data][:hold_explanation],   6									application_id: @current_opal_application.id)   						else   						activity_created = true   "						save_activity(object: @post,   =									type: { object: "post", verb: "resume_publishing" },   6									application_id: @current_opal_application.id)   					end   				end   			end       			# Create activity record   			unless activity_created    				save_activity(object: @post,   .							type: { object: "post", verb: "edit" },   4							application_id: @current_opal_application.id)   			end       .      # Add editor members association on post   5      @post.add_member(user: @user, opal: @post.opal)           5			# Update cache with associations and push the post   			@post.start_push   			@post.push_update       2			# If applicable, finish the post moving process   			if post_mover.present?   (				# Update the cache of its old moment   A				post_mover.update_moment_caches(params[:post][:creator_guid])       -				# Create activity record on origin moment   "				save_activity(object: @moment,   5							type: { object: "moment", verb: "move_post" },   							meta_data: {   6									brand_id: post_mover.move_to_moment.brand_id,   1									moment_id: post_mover.move_to_moment.id,   7									moment_title: post_mover.move_to_moment.title,   									post_id: @post.id,   									post_name: @post.name   								},   4							application_id: @current_opal_application.id)       $				# Create activity record on post    				save_activity(object: @post,   .							type: { object: "post", verb: "move" },   							meta_data: {   $									brand_id: @moment.brand_id,   									moment_id: @moment.id,   $									moment_title: @moment.title   								},   4							application_id: @current_opal_application.id)   			end       8			# Pull the record back out so it has its associations   6			@post = Moments::Post.unscoped.find_by_id(@post.id)       !			# DELIVERY CONTENT IF APPROVED   (			handle_content_delivery!(post: @post)       "			respond_with(@post) do |format|   %				format.html { signal_json_error }   ,				format.json { json_for_resource(@post) }   			end   		else   5			respond_with(@post, status: :unprocessable_entity)   		end   	end       	def destroy   8		return signal_json_error(as_http: true) unless @moment       /		@post = @moment.posts.find_by_id(params[:id])       6		return signal_json_error(as_http: true) unless @post       Q		# Return if the user doesn't have permission to delete content for this account   f		return signal_json_error(as_http: true) if @post.account && !@post.account.open_or_member_of?(@user)       ,		@post.creator_guid = params[:creator_guid]       		if @post.hide_async   			if @post.localizations   #				@post.localizations.each do |l|   ,					l.try(:post).try(:destroy_cache_record)   *					l.update_column(:parent_post_id, nil)   				end   			end       			# Create activity record   ,			activity = save_activity(object: @moment,   :									 type: { object: "moment", verb: "delete_post" },   									 comment: @post.name,   7									 application_id: @current_opal_application.id)       H			# Manually push this activity record since it's not embedded with the   			# pushed moment   +			activity.pusher_keys = @moment.push_keys   0			activity.creator_guid = params[:creator_guid]   			activity.push_update   			@post.is_visible = false       )			# RETRACT CONTENT IF ALREADY PUBLISHED    			retract_content!(post: @post)   			@post.save!   "			respond_with(@post) do |format|   ,				format.json { json_for_resource(@post) }   			end   		else   5			respond_with(@post, status: :unprocessable_entity)   		end   	end       $	def handle_update_from_email_or_sms   B		@post_action = @valid_email ? @object_type : params[:sms_action]   8		@message_body = @valid_email ? @email_body : @sms_body       -		post = Moments::Post.find_by_id(@object_id)       			if post   			params[:id] = post.id   &			params[:moment_id] = post.moment_id   			@moment = post.moment   			@brand = post.moment.brand   			@from_bridge = false       			case @post_action   			when "postpublish"   				unless post.is_published?   5					live_post_url = fuzzy_url_extract(@message_body)       					if live_post_url   						params[:post] = {   !							is_publishing_held: false,   &							update_publishing_status: true,   							manually_publish: true,   $							was_manually_published: true,   							is_published: true,   2							post_data: { live_post_url: live_post_url }   						}   7						send_confirmation_text(post) if @sms_body && post   						else   &						signal_json_error(as_http: true)   					end   				else   %					signal_json_error(as_http: true)   				end   			end   		else   #			signal_json_error(as_http: true)   		end   	end       !	def send_confirmation_text(post)   		begin   ?			confirming_for = CommunicationRecord.for_communicable(post).   C				for_notification_type(NotificationType.post_native_publishing).   				order(:updated_at).last       G			confirming_text = TextMessage.to_user(@user).for_communicable(post).   +				from_user(confirming_for.from_user).new       >			confirming_text.contact_method = @user.default_phone_number   N			confirming_text.notification_type = NotificationType.post_native_publishing   g			confirming_text.body = "Thanks! #{post.name} for #{post.moment.title} has been marked as published."   			confirming_text.send_sms!   		rescue => e   %			Honeybadger.notify(e, force: true)   		end   	end       	private       	def set_moment   w    @moment = Moments::Moment.for_user_with_privacy(brand_id: @brand.id, user_id: @user.id, from_bridge: @from_bridge).   !			find_by_id(params[:moment_id])       $		redirect_to_moments unless @moment   	end       	def fuzzy_url_extract(string)   B		if string.match("http://").nil? && string.match("https://").nil?   			string.insert(0, "http://")   		end   		URI.extract(string)[0]   	end       ,	# TODO @thoughtpunch - fix this moment view   1	# - https://github.com/opallabs/opal/issues/4287   !	# - modes: sms, email, all, none   $	def delete_pending_comm_records(nt)   J		@post.communication_records.pending.for_notification_type(nt).delete_all   	end       !	def create_communication_records   1		# Delete any pending SMS messages for this post   3		# as we don't have any way of knowing if dups/bad   .		nt = NotificationType.post_native_publishing   K		return delete_pending_comm_records(nt) if !@post.native_content_publisher       -		delivery_record = @post.set_delivery_record   3		mode = delivery_record.delivery_method rescue nil   1		user = delivery_record.delivery_user rescue nil       		if mode and user   			# Create text message(s)   E			if mode.to_s.match(/sms|all/) && user && user.default_phone_number   f				txt_msgs = @post.generate_text_message_bodies(options: { for_publishing: true, from_user: @user })       				txt_msgs.each do |msg|   >					# pluck the body off, merge rest of hash into 'meta_data'   					body = msg.delete(:body)       +					txt_msg = @post.text_messages.pending.    						for_notification_type(nt).   						from_user(@user).   						to_user(user).   							new       					txt_msg.body = body   7					txt_msg.contact_method = user.default_phone_number   ,					txt_msg.update_meta_data_from_hash(msg)   					txt_msg.save!   				end   			end       			# Create email message   			if mode.match(/email|all/)   i				email_msg = @post.email_messages.pending.for_notification_type(nt).from_user(@user).to_user(user).new   (				email_msg.email_address = user.email   				email_msg.save!   			end   		end   	end       	def set_checkpointable   >		@checkpointable = @moment.posts.find_by_id(params[:post_id])   	end       	def set_notable   8		@notable = @moment.posts.find_by(id: params[:post_id])   #		@notable_activity_object = "post"   *		@notable_pusher_keys = @moment.push_keys   	end         def stream_csv_file   S    exporter = Exporters::PostOption::PostOptionCsvExporterBase.new(content: @post)   $    csv_string = exporter.csv_string       send_data(         csv_string,          disposition: "attachment",   '      filename: "#{ @page_title }.csv",   5      type: "text/csv, charset=UTF-8; header=present"       )     end   end5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �          �          V       X���    �   �   �  m      			@post.push_update5��