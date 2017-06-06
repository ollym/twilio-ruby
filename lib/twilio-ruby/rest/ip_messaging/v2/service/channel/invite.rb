##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class IpMessaging < Domain
      class V2 < Version
        class ServiceContext < InstanceContext
          class ChannelContext < InstanceContext
            class InviteList < ListResource
              ##
              # Initialize the InviteList
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The service_sid
              # @param [String] channel_sid The channel_sid
              # @return [InviteList] InviteList
              def initialize(version, service_sid: nil, channel_sid: nil)
                super(version)

                # Path Solution
                @solution = {
                    service_sid: service_sid,
                    channel_sid: channel_sid
                }
                @uri = "/Services/#{@solution[:service_sid]}/Channels/#{@solution[:channel_sid]}/Invites"
              end

              ##
              # Retrieve a single page of InviteInstance records from the API.
              # Request is executed immediately.
              # @param [String] identity The identity
              # @param [String] role_sid The role_sid
              # @return [InviteInstance] Newly created InviteInstance
              def create(identity: nil, role_sid: Twilio::Values::Unset)
                data = Twilio::Values.of({
                    'Identity' => identity,
                    'RoleSid' => role_sid,
                })

                payload = @version.create(
                    'POST',
                    @uri,
                    data: data
                )

                return InviteInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    channel_sid: @solution[:channel_sid],
                )
              end

              ##
              # Lists InviteInstance records from the API as a list.
              # Unlike stream(), this operation is eager and will load `limit` records into
              # memory before returning.
              # @param [String] identity The identity
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #                   guarantees to never return more than limit.  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
              #  the default value of 50 records.  If no page_size is                      defined
              #  but a limit is defined, stream() will attempt to read                      the
              #  limit with the most efficient page size,                      i.e. min(limit, 1000)
              # @return [Array] Array of up to limit results
              def list(identity: Twilio::Values::Unset, limit: nil, page_size: nil)
                self.stream(
                    identity: identity,
                    limit: limit,
                    page_size: page_size
                ).entries
              end

              ##
              # Streams InviteInstance records from the API as an Enumerable.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [String] identity The identity
              # @param [Integer] limit Upper limit for the number of records to return.                  stream()
              #  guarantees to never return more than limit.                  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
              #  the default value of 50 records.                      If no page_size is defined
              #                       but a limit is defined, stream() will attempt to                      read the
              #  limit with the most efficient page size,                       i.e. min(limit, 1000)
              # @return [Enumerable] Enumerable that will yield up to limit results
              def stream(identity: Twilio::Values::Unset, limit: nil, page_size: nil)
                limits = @version.read_limits(limit, page_size)

                page = self.page(
                    identity: identity,
                    page_size: limits[:page_size],
                )

                @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
              end

              ##
              # When passed a block, yields InviteInstance records from the API.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [String] identity The identity
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
              # Retrieve a single page of InviteInstance records from the API.
              # Request is executed immediately.
              # @param [String] identity The identity
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of InviteInstance
              def page(identity: Twilio::Values::Unset, page_token: Twilio::Values::Unset, page_number: Twilio::Values::Unset, page_size: Twilio::Values.Unset)
                params = Twilio::Values.of({
                    'Identity' => identity,
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })
                response = @version.page(
                    'GET',
                    @uri,
                    params
                )
                return InvitePage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.IpMessaging.V2.InviteList>'
              end
            end

            class InvitePage < Page
              ##
              # Initialize the InvitePage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @param [String] service_sid The service_sid
              # @param [String] channel_sid The channel_sid
              # @return [InvitePage] InvitePage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of InviteInstance
              # @param [Hash] payload Payload response from the API
              # @return [InviteInstance] InviteInstance
              def get_instance(payload)
                return InviteInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    channel_sid: @solution[:channel_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.IpMessaging.V2.InvitePage>'
              end
            end

            class InviteContext < InstanceContext
              ##
              # Initialize the InviteContext
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The service_sid
              # @param [String] channel_sid The channel_sid
              # @param [String] sid The sid
              # @return [InviteContext] InviteContext
              def initialize(version, service_sid, channel_sid, sid)
                super(version)

                # Path Solution
                @solution = {
                    service_sid: service_sid,
                    channel_sid: channel_sid,
                    sid: sid,
                }
                @uri = "/Services/#{@solution[:service_sid]}/Channels/#{@solution[:channel_sid]}/Invites/#{@solution[:sid]}"
              end

              ##
              # Fetch a InviteInstance
              # @return [InviteInstance] Fetched InviteInstance
              def fetch
                params = Twilio::Values.of({})

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                return InviteInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    channel_sid: @solution[:channel_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Deletes the InviteInstance
              # @return [Boolean] true if delete succeeds, true otherwise
              def delete
                return @version.delete('delete', @uri)
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.IpMessaging.V2.InviteContext #{context}>"
              end
            end

            class InviteInstance < InstanceResource
              ##
              # Initialize the InviteInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] service_sid The service_sid
              # @param [String] channel_sid The channel_sid
              # @param [String] sid The sid
              # @return [InviteInstance] InviteInstance
              def initialize(version, payload, service_sid: nil, channel_sid: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'sid' => payload['sid'],
                    'account_sid' => payload['account_sid'],
                    'channel_sid' => payload['channel_sid'],
                    'service_sid' => payload['service_sid'],
                    'identity' => payload['identity'],
                    'date_created' => Twilio.deserialize_iso8601(payload['date_created']),
                    'date_updated' => Twilio.deserialize_iso8601(payload['date_updated']),
                    'role_sid' => payload['role_sid'],
                    'created_by' => payload['created_by'],
                    'url' => payload['url'],
                }

                # Context
                @instance_context = nil
                @params = {
                    'service_sid' => service_sid,
                    'channel_sid' => channel_sid,
                    'sid' => sid || @properties['sid'],
                }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @param [Version] version Version that contains the resource
              # @return [InviteContext] InviteContext for this InviteInstance
              def context
                unless @instance_context
                  @instance_context = InviteContext.new(
                      @version,
                      @params['service_sid'],
                      @params['channel_sid'],
                      @params['sid'],
                  )
                end
                @instance_context
              end

              def sid
                @properties['sid']
              end

              def account_sid
                @properties['account_sid']
              end

              def channel_sid
                @properties['channel_sid']
              end

              def service_sid
                @properties['service_sid']
              end

              def identity
                @properties['identity']
              end

              def date_created
                @properties['date_created']
              end

              def date_updated
                @properties['date_updated']
              end

              def role_sid
                @properties['role_sid']
              end

              def created_by
                @properties['created_by']
              end

              def url
                @properties['url']
              end

              ##
              # Fetch a InviteInstance
              # @return [InviteInstance] Fetched InviteInstance
              def fetch
                context.fetch
              end

              ##
              # Deletes the InviteInstance
              # @return [Boolean] true if delete succeeds, true otherwise
              def delete
                context.delete
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.IpMessaging.V2.InviteInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end