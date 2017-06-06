##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class IncomingPhoneNumberList < ListResource
            class MobileList < ListResource
              ##
              # Initialize the MobileList
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The unique id of the Account responsible for this
              #   phone number.
              # @return [MobileList] MobileList
              def initialize(version, account_sid: nil)
                super(version)

                # Path Solution
                @solution = {
                    account_sid: account_sid
                }
                @uri = "/Accounts/#{@solution[:account_sid]}/IncomingPhoneNumbers/Mobile.json"
              end

              ##
              # Lists MobileInstance records from the API as a list.
              # Unlike stream(), this operation is eager and will load `limit` records into
              # memory before returning.
              # @param [Boolean] beta The beta
              # @param [String] friendly_name The friendly_name
              # @param [String] phone_number The phone_number
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #                   guarantees to never return more than limit.  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
              #  the default value of 50 records.  If no page_size is                      defined
              #  but a limit is defined, stream() will attempt to read                      the
              #  limit with the most efficient page size,                      i.e. min(limit, 1000)
              # @return [Array] Array of up to limit results
              def list(beta: Twilio::Values::Unset, friendly_name: Twilio::Values::Unset, phone_number: Twilio::Values::Unset, limit: nil, page_size: nil)
                self.stream(
                    beta: beta,
                    friendly_name: friendly_name,
                    phone_number: phone_number,
                    limit: limit,
                    page_size: page_size
                ).entries
              end

              ##
              # Streams MobileInstance records from the API as an Enumerable.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [Boolean] beta The beta
              # @param [String] friendly_name The friendly_name
              # @param [String] phone_number The phone_number
              # @param [Integer] limit Upper limit for the number of records to return.                  stream()
              #  guarantees to never return more than limit.                  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
              #  the default value of 50 records.                      If no page_size is defined
              #                       but a limit is defined, stream() will attempt to                      read the
              #  limit with the most efficient page size,                       i.e. min(limit, 1000)
              # @return [Enumerable] Enumerable that will yield up to limit results
              def stream(beta: Twilio::Values::Unset, friendly_name: Twilio::Values::Unset, phone_number: Twilio::Values::Unset, limit: nil, page_size: nil)
                limits = @version.read_limits(limit, page_size)

                page = self.page(
                    beta: beta,
                    friendly_name: friendly_name,
                    phone_number: phone_number,
                    page_size: limits[:page_size],
                )

                @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
              end

              ##
              # When passed a block, yields MobileInstance records from the API.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [Boolean] beta The beta
              # @param [String] friendly_name The friendly_name
              # @param [String] phone_number The phone_number
              # @param [Integer] limit Upper limit for the number of records to return.                  stream()
              #  guarantees to never return more than limit.                  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when                       not set will use
              #  the default value of 50 records.                      If no page_size is defined
              #                       but a limit is defined, stream() will attempt to read the
              #                       limit with the most efficient page size, i.e. min(limit, 1000)
              def each
                limits = @version.read_limits

                page = self.page(
                    page_size: limits[:page_size],
                )

                @version.stream(page,
                                limit: limits[:limit],
                                page_limit: limits[:page_limit]).each {|x| yield x}
              end

              ##
              # Retrieve a single page of MobileInstance records from the API.
              # Request is executed immediately.
              # @param [Boolean] beta The beta
              # @param [String] friendly_name The friendly_name
              # @param [String] phone_number The phone_number
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of MobileInstance
              def page(beta: Twilio::Values::Unset, friendly_name: Twilio::Values::Unset, phone_number: Twilio::Values::Unset, page_token: Twilio::Values::Unset, page_number: Twilio::Values::Unset, page_size: Twilio::Values.Unset)
                params = Twilio::Values.of({
                    'Beta' => beta,
                    'FriendlyName' => friendly_name,
                    'PhoneNumber' => phone_number,
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })
                response = @version.page(
                    'GET',
                    @uri,
                    params
                )
                return MobilePage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of MobileInstance records from the API.
              # Request is executed immediately.
              # @param [String] phone_number The phone_number
              # @param [String] api_version The api_version
              # @param [String] friendly_name The friendly_name
              # @param [String] sms_application_sid The sms_application_sid
              # @param [String] sms_fallback_method The sms_fallback_method
              # @param [String] sms_fallback_url The sms_fallback_url
              # @param [String] sms_method The sms_method
              # @param [String] sms_url The sms_url
              # @param [String] status_callback The status_callback
              # @param [String] status_callback_method The status_callback_method
              # @param [String] voice_application_sid The voice_application_sid
              # @param [Boolean] voice_caller_id_lookup The voice_caller_id_lookup
              # @param [String] voice_fallback_method The voice_fallback_method
              # @param [String] voice_fallback_url The voice_fallback_url
              # @param [String] voice_method The voice_method
              # @param [String] voice_url The voice_url
              # @return [MobileInstance] Newly created MobileInstance
              def create(phone_number: nil, api_version: Twilio::Values::Unset, friendly_name: Twilio::Values::Unset, sms_application_sid: Twilio::Values::Unset, sms_fallback_method: Twilio::Values::Unset, sms_fallback_url: Twilio::Values::Unset, sms_method: Twilio::Values::Unset, sms_url: Twilio::Values::Unset, status_callback: Twilio::Values::Unset, status_callback_method: Twilio::Values::Unset, voice_application_sid: Twilio::Values::Unset, voice_caller_id_lookup: Twilio::Values::Unset, voice_fallback_method: Twilio::Values::Unset, voice_fallback_url: Twilio::Values::Unset, voice_method: Twilio::Values::Unset, voice_url: Twilio::Values::Unset)
                data = Twilio::Values.of({
                    'PhoneNumber' => phone_number,
                    'ApiVersion' => api_version,
                    'FriendlyName' => friendly_name,
                    'SmsApplicationSid' => sms_application_sid,
                    'SmsFallbackMethod' => sms_fallback_method,
                    'SmsFallbackUrl' => sms_fallback_url,
                    'SmsMethod' => sms_method,
                    'SmsUrl' => sms_url,
                    'StatusCallback' => status_callback,
                    'StatusCallbackMethod' => status_callback_method,
                    'VoiceApplicationSid' => voice_application_sid,
                    'VoiceCallerIdLookup' => voice_caller_id_lookup,
                    'VoiceFallbackMethod' => voice_fallback_method,
                    'VoiceFallbackUrl' => voice_fallback_url,
                    'VoiceMethod' => voice_method,
                    'VoiceUrl' => voice_url,
                })

                payload = @version.create(
                    'POST',
                    @uri,
                    data: data
                )

                return MobileInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Api.V2010.MobileList>'
              end
            end

            class MobilePage < Page
              ##
              # Initialize the MobilePage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @param [String] account_sid The unique id of the Account responsible for this
              #   phone number.
              # @return [MobilePage] MobilePage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of MobileInstance
              # @param [Hash] payload Payload response from the API
              # @return [MobileInstance] MobileInstance
              def get_instance(payload)
                return MobileInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Api.V2010.MobilePage>'
              end
            end

            class MobileInstance < InstanceResource
              ##
              # Initialize the MobileInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] account_sid The unique id of the Account responsible for this
              #   phone number.
              # @return [MobileInstance] MobileInstance
              def initialize(version, payload, account_sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'address_requirements' => payload['address_requirements'],
                    'api_version' => payload['api_version'],
                    'beta' => payload['beta'],
                    'capabilities' => payload['capabilities'],
                    'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                    'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                    'friendly_name' => payload['friendly_name'],
                    'phone_number' => payload['phone_number'],
                    'sid' => payload['sid'],
                    'sms_application_sid' => payload['sms_application_sid'],
                    'sms_fallback_method' => payload['sms_fallback_method'],
                    'sms_fallback_url' => payload['sms_fallback_url'],
                    'sms_method' => payload['sms_method'],
                    'sms_url' => payload['sms_url'],
                    'status_callback' => payload['status_callback'],
                    'status_callback_method' => payload['status_callback_method'],
                    'trunk_sid' => payload['trunk_sid'],
                    'uri' => payload['uri'],
                    'voice_application_sid' => payload['voice_application_sid'],
                    'voice_caller_id_lookup' => payload['voice_caller_id_lookup'],
                    'voice_fallback_method' => payload['voice_fallback_method'],
                    'voice_fallback_url' => payload['voice_fallback_url'],
                    'voice_method' => payload['voice_method'],
                    'voice_url' => payload['voice_url'],
                }
              end

              def account_sid
                @properties['account_sid']
              end

              def address_requirements
                @properties['address_requirements']
              end

              def api_version
                @properties['api_version']
              end

              def beta
                @properties['beta']
              end

              def capabilities
                @properties['capabilities']
              end

              def date_created
                @properties['date_created']
              end

              def date_updated
                @properties['date_updated']
              end

              def friendly_name
                @properties['friendly_name']
              end

              def phone_number
                @properties['phone_number']
              end

              def sid
                @properties['sid']
              end

              def sms_application_sid
                @properties['sms_application_sid']
              end

              def sms_fallback_method
                @properties['sms_fallback_method']
              end

              def sms_fallback_url
                @properties['sms_fallback_url']
              end

              def sms_method
                @properties['sms_method']
              end

              def sms_url
                @properties['sms_url']
              end

              def status_callback
                @properties['status_callback']
              end

              def status_callback_method
                @properties['status_callback_method']
              end

              def trunk_sid
                @properties['trunk_sid']
              end

              def uri
                @properties['uri']
              end

              def voice_application_sid
                @properties['voice_application_sid']
              end

              def voice_caller_id_lookup
                @properties['voice_caller_id_lookup']
              end

              def voice_fallback_method
                @properties['voice_fallback_method']
              end

              def voice_fallback_url
                @properties['voice_fallback_url']
              end

              def voice_method
                @properties['voice_method']
              end

              def voice_url
                @properties['voice_url']
              end

              ##
              # Provide a user friendly representation
              def to_s
                "<Twilio.Api.V2010.MobileInstance>"
              end
            end
          end
        end
      end
    end
  end
end