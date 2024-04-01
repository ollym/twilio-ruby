##
 # This code was generated by
 # ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
 #  |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
 #  |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
 #
 # NOTE: This class is auto generated by OpenAPI Generator.
 # https://openapi-generator.tech
 # Do not edit the class manually.

require 'twilio-ruby/base/client_base'

module Twilio
    module REST
        ##
        # A client for accessing the Twilio API.
        class Client < ClientBase

            ##
            # Access the Accounts Twilio Domain
            def accounts
                @accounts ||= Accounts.new self
            end
            ##
            # Access the Api Twilio Domain
            def api
                @api ||= Api.new self
            end
            ##
            # Access the Bulkexports Twilio Domain
            def bulkexports
                @bulkexports ||= Bulkexports.new self
            end
            ##
            # Access the Chat Twilio Domain
            def chat
                @chat ||= Chat.new self
            end
            ##
            # Access the Content Twilio Domain
            def content
                @content ||= Content.new self
            end
            ##
            # Access the Conversations Twilio Domain
            def conversations
                @conversations ||= Conversations.new self
            end
            ##
            # Access the Events Twilio Domain
            def events
                @events ||= Events.new self
            end
            ##
            # Access the FlexApi Twilio Domain
            def flex_api
                @flex_api ||= FlexApi.new self
            end
            ##
            # Access the FrontlineApi Twilio Domain
            def frontline_api
                @frontline_api ||= FrontlineApi.new self
            end
            ##
            # Access the Insights Twilio Domain
            def insights
                @insights ||= Insights.new self
            end
            ##
            # Access the Intelligence Twilio Domain
            def intelligence
                @intelligence ||= Intelligence.new self
            end
            ##
            # Access the IpMessaging Twilio Domain
            def ip_messaging
                @ip_messaging ||= IpMessaging.new self
            end
            ##
            # Access the Lookups Twilio Domain
            def lookups
                @lookups ||= Lookups.new self
            end
            ##
            # Access the PreviewMessaging Twilio Domain
            def preview_messaging
                @preview_messaging ||= PreviewMessaging.new self
            end
            ##
            # Access the Messaging Twilio Domain
            def messaging
                @messaging ||= Messaging.new self
            end
            ##
            # Access the Microvisor Twilio Domain
            def microvisor
                @microvisor ||= Microvisor.new self
            end
            ##
            # Access the Monitor Twilio Domain
            def monitor
                @monitor ||= Monitor.new self
            end
            ##
            # Access the Notify Twilio Domain
            def notify
                @notify ||= Notify.new self
            end
            ##
            # Access the Numbers Twilio Domain
            def numbers
                @numbers ||= Numbers.new self
            end
            ##
            # Access the Oauth Twilio Domain
            def oauth
                @oauth ||= Oauth.new self
            end
            ##
            # Access the Preview Twilio Domain
            def preview
                @preview ||= Preview.new self
            end
            ##
            # Access the Pricing Twilio Domain
            def pricing
                @pricing ||= Pricing.new self
            end
            ##
            # Access the Proxy Twilio Domain
            def proxy
                @proxy ||= Proxy.new self
            end
            ##
            # Access the Routes Twilio Domain
            def routes
                @routes ||= Routes.new self
            end
            ##
            # Access the Serverless Twilio Domain
            def serverless
                @serverless ||= Serverless.new self
            end
            ##
            # Access the Studio Twilio Domain
            def studio
                @studio ||= Studio.new self
            end
            ##
            # Access the Supersim Twilio Domain
            def supersim
                @supersim ||= Supersim.new self
            end
            ##
            # Access the Sync Twilio Domain
            def sync
                @sync ||= Sync.new self
            end
            ##
            # Access the Taskrouter Twilio Domain
            def taskrouter
                @taskrouter ||= Taskrouter.new self
            end
            ##
            # Access the Trunking Twilio Domain
            def trunking
                @trunking ||= Trunking.new self
            end
            ##
            # Access the Trusthub Twilio Domain
            def trusthub
                @trusthub ||= Trusthub.new self
            end
            ##
            # Access the Verify Twilio Domain
            def verify
                @verify ||= Verify.new self
            end
            ##
            # Access the Video Twilio Domain
            def video
                @video ||= Video.new self
            end
            ##
            # Access the Voice Twilio Domain
            def voice
                @voice ||= Voice.new self
            end
            ##
            # Access the Wireless Twilio Domain
            def wireless
                @wireless ||= Wireless.new self
            end

            ##
            # @param [string] sid The Twilio-provided string that uniquely identifies the Address resource to fetch.

            # @return [Twilio::REST::Api::V2010::AccountContext::AddressInstance] if sid was passed.
            # @return [Twilio::REST::Api::V2010::AccountContext::AddressList]
            def addresses(sid=:unset)
                self.api.v2010.account.addresses(sid)
            end
            ##
            # @param [string] sid The Twilio-provided string that uniquely identifies the Application resource to fetch.

            # @return [Twilio::REST::Api::V2010::AccountContext::ApplicationInstance] if sid was passed.
            # @return [Twilio::REST::Api::V2010::AccountContext::ApplicationList]
            def applications(sid=:unset)
                self.api.v2010.account.applications(sid)
            end
            ##
            # @param [string] connectAppSid The SID of the Connect App to fetch.

            # @return [Twilio::REST::Api::V2010::AccountContext::AuthorizedConnectAppInstance] if connectAppSid was passed.
            # @return [Twilio::REST::Api::V2010::AccountContext::AuthorizedConnectAppList]
            def authorized_connect_apps(connectAppSid=:unset)
                self.api.v2010.account.authorized_connect_apps(connectAppSid)
            end
            ##
            # @param [string] countryCode The [ISO-3166-1](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country code of the country to fetch available phone number information about.

            # @return [Twilio::REST::Api::V2010::AccountContext::AvailablePhoneNumberCountryInstance] if countryCode was passed.
            # @return [Twilio::REST::Api::V2010::AccountContext::AvailablePhoneNumberCountryList]
            def available_phone_numbers(countryCode=:unset)
                self.api.v2010.account.available_phone_numbers(countryCode)
            end
            
            ##
            # @param [string] sid The SID of the Call resource to fetch.

            # @return [Twilio::REST::Api::V2010::AccountContext::CallInstance] if sid was passed.
            # @return [Twilio::REST::Api::V2010::AccountContext::CallList]
            def calls(sid=:unset)
                self.api.v2010.account.calls(sid)
            end
            ##
            # @param [string] sid The Twilio-provided string that uniquely identifies the Conference resource to fetch

            # @return [Twilio::REST::Api::V2010::AccountContext::ConferenceInstance] if sid was passed.
            # @return [Twilio::REST::Api::V2010::AccountContext::ConferenceList]
            def conferences(sid=:unset)
                self.api.v2010.account.conferences(sid)
            end
            ##
            # @param [string] sid The Twilio-provided string that uniquely identifies the ConnectApp resource to fetch.

            # @return [Twilio::REST::Api::V2010::AccountContext::ConnectAppInstance] if sid was passed.
            # @return [Twilio::REST::Api::V2010::AccountContext::ConnectAppList]
            def connect_apps(sid=:unset)
                self.api.v2010.account.connect_apps(sid)
            end
            ##
            # @param [string] sid The Twilio-provided string that uniquely identifies the IncomingPhoneNumber resource to fetch.

            # @return [Twilio::REST::Api::V2010::AccountContext::IncomingPhoneNumberInstance] if sid was passed.
            # @return [Twilio::REST::Api::V2010::AccountContext::IncomingPhoneNumberList]
            def incoming_phone_numbers(sid=:unset)
                self.api.v2010.account.incoming_phone_numbers(sid)
            end
            ##
            # @param [string] sid The Twilio-provided string that uniquely identifies the Key resource to fetch.

            # @return [Twilio::REST::Api::V2010::AccountContext::KeyInstance] if sid was passed.
            # @return [Twilio::REST::Api::V2010::AccountContext::KeyList]
            def keys(sid=:unset)
                self.api.v2010.account.keys(sid)
            end
            ##
            # @param [string] sid The SID of the Message resource to be fetched

            # @return [Twilio::REST::Api::V2010::AccountContext::MessageInstance] if sid was passed.
            # @return [Twilio::REST::Api::V2010::AccountContext::MessageList]
            def messages(sid=:unset)
                self.api.v2010.account.messages(sid)
            end
            
            
            ##
            # @param [string] sid The Twilio-provided string that uniquely identifies the Notification resource to fetch.

            # @return [Twilio::REST::Api::V2010::AccountContext::NotificationInstance] if sid was passed.
            # @return [Twilio::REST::Api::V2010::AccountContext::NotificationList]
            def notifications(sid=:unset)
                self.api.v2010.account.notifications(sid)
            end
            ##
            # @param [string] sid The Twilio-provided string that uniquely identifies the OutgoingCallerId resource to fetch.

            # @return [Twilio::REST::Api::V2010::AccountContext::OutgoingCallerIdInstance] if sid was passed.
            # @return [Twilio::REST::Api::V2010::AccountContext::OutgoingCallerIdList]
            def outgoing_caller_ids(sid=:unset)
                self.api.v2010.account.outgoing_caller_ids(sid)
            end
            ##
            # @param [string] sid The Twilio-provided string that uniquely identifies the Queue resource to fetch

            # @return [Twilio::REST::Api::V2010::AccountContext::QueueInstance] if sid was passed.
            # @return [Twilio::REST::Api::V2010::AccountContext::QueueList]
            def queues(sid=:unset)
                self.api.v2010.account.queues(sid)
            end
            ##
            # @param [string] sid The Twilio-provided string that uniquely identifies the Recording resource to fetch.

            # @return [Twilio::REST::Api::V2010::AccountContext::RecordingInstance] if sid was passed.
            # @return [Twilio::REST::Api::V2010::AccountContext::RecordingList]
            def recordings(sid=:unset)
                self.api.v2010.account.recordings(sid)
            end
            ##
            # @param [string] sid The Twilio-provided string that uniquely identifies the ShortCode resource to fetch

            # @return [Twilio::REST::Api::V2010::AccountContext::ShortCodeInstance] if sid was passed.
            # @return [Twilio::REST::Api::V2010::AccountContext::ShortCodeList]
            def short_codes(sid=:unset)
                self.api.v2010.account.short_codes(sid)
            end
            ##

            # @return [Twilio::REST::Api::V2010::AccountContext::SigningKeyInstance] if sid was passed.
            # @return [Twilio::REST::Api::V2010::AccountContext::SigningKeyList]
            def signing_keys(sid=:unset)
                self.api.v2010.account.signing_keys(sid)
            end
            
            
            ##
            # @param [string] sid The Twilio-provided string that uniquely identifies the Transcription resource to fetch.

            # @return [Twilio::REST::Api::V2010::AccountContext::TranscriptionInstance] if sid was passed.
            # @return [Twilio::REST::Api::V2010::AccountContext::TranscriptionList]
            def transcriptions(sid=:unset)
                self.api.v2010.account.transcriptions(sid)
            end
            
            

            ##
            # Provide a user friendly representation
            def to_s
                "#<Twilio::REST::Client #{@account_sid}>"
            end
        end
    end
end

