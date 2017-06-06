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
          class CallContext < InstanceContext
            class NotificationList < ListResource
              ##
              # Initialize the NotificationList
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The account_sid
              # @param [String] call_sid The call_sid
              # @return [NotificationList] NotificationList
              def initialize(version, account_sid: nil, call_sid: nil)
                super(version)

                # Path Solution
                @solution = {
                    account_sid: account_sid,
                    call_sid: call_sid
                }
                @uri = "/Accounts/#{@solution[:account_sid]}/Calls/#{@solution[:call_sid]}/Notifications.json"
              end

              ##
              # Lists NotificationInstance records from the API as a list.
              # Unlike stream(), this operation is eager and will load `limit` records into
              # memory before returning.
              # @param [String] log The log
              # @param [Time] message_date_before The message_date
              # @param [Time] message_date The message_date
              # @param [Time] message_date_after: The message_date
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #                   guarantees to never return more than limit.  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
              #  the default value of 50 records.  If no page_size is                      defined
              #  but a limit is defined, stream() will attempt to read                      the
              #  limit with the most efficient page size,                      i.e. min(limit, 1000)
              # @return [Array] Array of up to limit results
              def list(log: Twilio::Values::Unset, message_date_before: Twilio::Values::Unset, message_date: Twilio::Values::Unset, message_date_after: Twilio::Values::Unset, limit: nil, page_size: nil)
                self.stream(
                    log: log,
                    message_date_before: message_date_before,
                    message_date: message_date,
                    message_date_after: message_date_after,
                    limit: limit,
                    page_size: page_size
                ).entries
              end

              ##
              # Streams NotificationInstance records from the API as an Enumerable.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [String] log The log
              # @param [Time] message_date_before The message_date
              # @param [Time] message_date The message_date
              # @param [Time] message_date_after: The message_date
              # @param [Integer] limit Upper limit for the number of records to return.                  stream()
              #  guarantees to never return more than limit.                  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
              #  the default value of 50 records.                      If no page_size is defined
              #                       but a limit is defined, stream() will attempt to                      read the
              #  limit with the most efficient page size,                       i.e. min(limit, 1000)
              # @return [Enumerable] Enumerable that will yield up to limit results
              def stream(log: Twilio::Values::Unset, message_date_before: Twilio::Values::Unset, message_date: Twilio::Values::Unset, message_date_after: Twilio::Values::Unset, limit: nil, page_size: nil)
                limits = @version.read_limits(limit, page_size)

                page = self.page(
                    log: log,
                    message_date_before: message_date_before,
                    message_date: message_date,
                    message_date_after: message_date_after,
                    page_size: limits[:page_size],
                )

                @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
              end

              ##
              # When passed a block, yields NotificationInstance records from the API.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [String] log The log
              # @param [Time] message_date_before The message_date
              # @param [Time] message_date The message_date
              # @param [Time] message_date_after: The message_date
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
              # Retrieve a single page of NotificationInstance records from the API.
              # Request is executed immediately.
              # @param [String] log The log
              # @param [Time] message_date_before The message_date
              # @param [Time] message_date The message_date
              # @param [Time] message_date_after: The message_date
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of NotificationInstance
              def page(log: Twilio::Values::Unset, message_date_before: Twilio::Values::Unset, message_date: Twilio::Values::Unset, message_date_after: Twilio::Values::Unset, page_token: Twilio::Values::Unset, page_number: Twilio::Values::Unset, page_size: Twilio::Values.Unset)
                params = Twilio::Values.of({
                    'Log' => log,
                    'MessageDate<' => Twilio.serialize_iso8601(message_date_before),
                    'MessageDate' => Twilio.serialize_iso8601(message_date),
                    'MessageDate>' => Twilio.serialize_iso8601(message_date_after),
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })
                response = @version.page(
                    'GET',
                    @uri,
                    params
                )
                return NotificationPage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Api.V2010.NotificationList>'
              end
            end

            class NotificationPage < Page
              ##
              # Initialize the NotificationPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @param [String] account_sid The account_sid
              # @param [String] call_sid The call_sid
              # @return [NotificationPage] NotificationPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of NotificationInstance
              # @param [Hash] payload Payload response from the API
              # @return [NotificationInstance] NotificationInstance
              def get_instance(payload)
                return NotificationInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    call_sid: @solution[:call_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Api.V2010.NotificationPage>'
              end
            end

            class NotificationContext < InstanceContext
              ##
              # Initialize the NotificationContext
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The account_sid
              # @param [String] call_sid The call_sid
              # @param [String] sid The sid
              # @return [NotificationContext] NotificationContext
              def initialize(version, account_sid, call_sid, sid)
                super(version)

                # Path Solution
                @solution = {
                    account_sid: account_sid,
                    call_sid: call_sid,
                    sid: sid,
                }
                @uri = "/Accounts/#{@solution[:account_sid]}/Calls/#{@solution[:call_sid]}/Notifications/#{@solution[:sid]}.json"
              end

              ##
              # Fetch a NotificationInstance
              # @return [NotificationInstance] Fetched NotificationInstance
              def fetch
                params = Twilio::Values.of({})

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                return NotificationInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    call_sid: @solution[:call_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Deletes the NotificationInstance
              # @return [Boolean] true if delete succeeds, true otherwise
              def delete
                return @version.delete('delete', @uri)
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Api.V2010.NotificationContext #{context}>"
              end
            end

            class NotificationInstance < InstanceResource
              ##
              # Initialize the NotificationInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] account_sid The account_sid
              # @param [String] call_sid The call_sid
              # @param [String] sid The sid
              # @return [NotificationInstance] NotificationInstance
              def initialize(version, payload, account_sid: nil, call_sid: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'api_version' => payload['api_version'],
                    'call_sid' => payload['call_sid'],
                    'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                    'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                    'error_code' => payload['error_code'],
                    'log' => payload['log'],
                    'message_date' => Twilio.deserialize_rfc2822(payload['message_date']),
                    'message_text' => payload['message_text'],
                    'more_info' => payload['more_info'],
                    'request_method' => payload['request_method'],
                    'request_url' => payload['request_url'],
                    'sid' => payload['sid'],
                    'uri' => payload['uri'],
                    'request_variables' => payload['request_variables'],
                    'response_body' => payload['response_body'],
                    'response_headers' => payload['response_headers'],
                }

                # Context
                @instance_context = nil
                @params = {
                    'account_sid' => account_sid,
                    'call_sid' => call_sid,
                    'sid' => sid || @properties['sid'],
                }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @param [Version] version Version that contains the resource
              # @return [NotificationContext] NotificationContext for this NotificationInstance
              def context
                unless @instance_context
                  @instance_context = NotificationContext.new(
                      @version,
                      @params['account_sid'],
                      @params['call_sid'],
                      @params['sid'],
                  )
                end
                @instance_context
              end

              def account_sid
                @properties['account_sid']
              end

              def api_version
                @properties['api_version']
              end

              def call_sid
                @properties['call_sid']
              end

              def date_created
                @properties['date_created']
              end

              def date_updated
                @properties['date_updated']
              end

              def error_code
                @properties['error_code']
              end

              def log
                @properties['log']
              end

              def message_date
                @properties['message_date']
              end

              def message_text
                @properties['message_text']
              end

              def more_info
                @properties['more_info']
              end

              def request_method
                @properties['request_method']
              end

              def request_url
                @properties['request_url']
              end

              def request_variables
                @properties['request_variables']
              end

              def response_body
                @properties['response_body']
              end

              def response_headers
                @properties['response_headers']
              end

              def sid
                @properties['sid']
              end

              def uri
                @properties['uri']
              end

              ##
              # Fetch a NotificationInstance
              # @return [NotificationInstance] Fetched NotificationInstance
              def fetch
                context.fetch
              end

              ##
              # Deletes the NotificationInstance
              # @return [Boolean] true if delete succeeds, true otherwise
              def delete
                context.delete
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Api.V2010.NotificationInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end