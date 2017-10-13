##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Proxy < Domain
      class V1 < Version
        class ServiceContext < InstanceContext
          class SessionContext < InstanceContext
            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class ParticipantList < ListResource
              ##
              # Initialize the ParticipantList
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The unique SID identifier of the Service.
              # @param [String] session_sid The unique SID identifier of the Session.
              # @return [ParticipantList] ParticipantList
              def initialize(version, service_sid: nil, session_sid: nil)
                super(version)

                # Path Solution
                @solution = {
                    service_sid: service_sid,
                    session_sid: session_sid
                }
                @uri = "/Services/#{@solution[:service_sid]}/Sessions/#{@solution[:session_sid]}/Participants"
              end

              ##
              # Lists ParticipantInstance records from the API as a list.
              # Unlike stream(), this operation is eager and will load `limit` records into
              # memory before returning.
              # @param [participant.ParticipantType] participant_type The participant_type
              # @param [String] identifier The identifier
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit.  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records.  If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Array] Array of up to limit results
              def list(participant_type: :unset, identifier: :unset, limit: nil, page_size: nil)
                self.stream(
                    participant_type: participant_type,
                    identifier: identifier,
                    limit: limit,
                    page_size: page_size
                ).entries
              end

              ##
              # Streams ParticipantInstance records from the API as an Enumerable.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [participant.ParticipantType] participant_type The participant_type
              # @param [String] identifier The identifier
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit. Default is no limit.
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records. If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Enumerable] Enumerable that will yield up to limit results
              def stream(participant_type: :unset, identifier: :unset, limit: nil, page_size: nil)
                limits = @version.read_limits(limit, page_size)

                page = self.page(
                    participant_type: participant_type,
                    identifier: identifier,
                    page_size: limits[:page_size],
                )

                @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
              end

              ##
              # When passed a block, yields ParticipantInstance records from the API.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
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
              # Retrieve a single page of ParticipantInstance records from the API.
              # Request is executed immediately.
              # @param [participant.ParticipantType] participant_type The participant_type
              # @param [String] identifier The identifier
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of ParticipantInstance
              def page(participant_type: :unset, identifier: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                params = Twilio::Values.of({
                    'ParticipantType' => participant_type,
                    'Identifier' => identifier,
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })
                response = @version.page(
                    'GET',
                    @uri,
                    params
                )
                ParticipantPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of ParticipantInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of ParticipantInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                ParticipantPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of ParticipantInstance records from the API.
              # Request is executed immediately.
              # @param [String] identifier The phone number of this Participant.
              # @param [String] friendly_name A human readable description of this resource, up
              #   to 64 characters.
              # @param [participant.ParticipantType] participant_type The Participant Type of
              #   this Participant. One of `message-only`, `voice-only` or `voice-and-message`.
              # @param [String] proxy_identifier The proxy phone number for this Participant.
              # @param [String] proxy_identifier_sid The unique SID identifier of the Proxy
              #   Identifier.
              # @return [ParticipantInstance] Newly created ParticipantInstance
              def create(identifier: nil, friendly_name: :unset, participant_type: :unset, proxy_identifier: :unset, proxy_identifier_sid: :unset)
                data = Twilio::Values.of({
                    'Identifier' => identifier,
                    'FriendlyName' => friendly_name,
                    'ParticipantType' => participant_type,
                    'ProxyIdentifier' => proxy_identifier,
                    'ProxyIdentifierSid' => proxy_identifier_sid,
                })

                payload = @version.create(
                    'POST',
                    @uri,
                    data: data
                )

                ParticipantInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    session_sid: @solution[:session_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Proxy.V1.ParticipantList>'
              end
            end

            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class ParticipantPage < Page
              ##
              # Initialize the ParticipantPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [ParticipantPage] ParticipantPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of ParticipantInstance
              # @param [Hash] payload Payload response from the API
              # @return [ParticipantInstance] ParticipantInstance
              def get_instance(payload)
                ParticipantInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    session_sid: @solution[:session_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Proxy.V1.ParticipantPage>'
              end
            end

            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class ParticipantContext < InstanceContext
              ##
              # Initialize the ParticipantContext
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The unique SID identifier of the Service.
              # @param [String] session_sid The unique SID identifier of the Session.
              # @param [String] sid A 34 character string that uniquely identifies this
              #   Participant.
              # @return [ParticipantContext] ParticipantContext
              def initialize(version, service_sid, session_sid, sid)
                super(version)

                # Path Solution
                @solution = {
                    service_sid: service_sid,
                    session_sid: session_sid,
                    sid: sid,
                }
                @uri = "/Services/#{@solution[:service_sid]}/Sessions/#{@solution[:session_sid]}/Participants/#{@solution[:sid]}"

                # Dependents
                @message_interactions = nil
              end

              ##
              # Fetch a ParticipantInstance
              # @return [ParticipantInstance] Fetched ParticipantInstance
              def fetch
                params = Twilio::Values.of({})

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                ParticipantInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    session_sid: @solution[:session_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Deletes the ParticipantInstance
              # @return [Boolean] true if delete succeeds, true otherwise
              def delete
                @version.delete('delete', @uri)
              end

              ##
              # Update the ParticipantInstance
              # @param [participant.ParticipantType] participant_type The Participant Type of
              #   this Participant. One of `message-only`, `voice-only` or `voice-and-message`.
              # @param [String] identifier The phone number of this Participant.
              # @param [String] friendly_name A human readable description of this resource, up
              #   to 64 characters.
              # @param [String] proxy_identifier The proxy phone number for this Participant.
              # @param [String] proxy_identifier_sid The unique SID identifier of the Proxy
              #   Identifier.
              # @return [ParticipantInstance] Updated ParticipantInstance
              def update(participant_type: :unset, identifier: :unset, friendly_name: :unset, proxy_identifier: :unset, proxy_identifier_sid: :unset)
                data = Twilio::Values.of({
                    'ParticipantType' => participant_type,
                    'Identifier' => identifier,
                    'FriendlyName' => friendly_name,
                    'ProxyIdentifier' => proxy_identifier,
                    'ProxyIdentifierSid' => proxy_identifier_sid,
                })

                payload = @version.update(
                    'POST',
                    @uri,
                    data: data,
                )

                ParticipantInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    session_sid: @solution[:session_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Access the message_interactions
              # @return [MessageInteractionList]
              # @return [MessageInteractionContext] if sid was passed.
              def message_interactions(sid=:unset)
                raise ArgumentError, 'sid cannot be nil' if sid.nil?

                if sid != :unset
                  return MessageInteractionContext.new(
                      @version,
                      @solution[:service_sid],
                      @solution[:session_sid],
                      @solution[:sid],
                      sid,
                  )
                end

                unless @message_interactions
                  @message_interactions = MessageInteractionList.new(
                      @version,
                      service_sid: @solution[:service_sid],
                      session_sid: @solution[:session_sid],
                      participant_sid: @solution[:sid],
                  )
                end

                @message_interactions
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Proxy.V1.ParticipantContext #{context}>"
              end
            end

            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class ParticipantInstance < InstanceResource
              ##
              # Initialize the ParticipantInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] service_sid The unique SID identifier of the Service.
              # @param [String] session_sid The unique SID identifier of the Session.
              # @param [String] sid A 34 character string that uniquely identifies this
              #   Participant.
              # @return [ParticipantInstance] ParticipantInstance
              def initialize(version, payload, service_sid: nil, session_sid: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'sid' => payload['sid'],
                    'session_sid' => payload['session_sid'],
                    'service_sid' => payload['service_sid'],
                    'account_sid' => payload['account_sid'],
                    'friendly_name' => payload['friendly_name'],
                    'participant_type' => payload['participant_type'],
                    'identifier' => payload['identifier'],
                    'proxy_identifier' => payload['proxy_identifier'],
                    'proxy_identifier_sid' => payload['proxy_identifier_sid'],
                    'date_deleted' => Twilio.deserialize_iso8601_datetime(payload['date_deleted']),
                    'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                    'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                    'url' => payload['url'],
                    'links' => payload['links'],
                }

                # Context
                @instance_context = nil
                @params = {
                    'service_sid' => service_sid,
                    'session_sid' => session_sid,
                    'sid' => sid || @properties['sid'],
                }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [ParticipantContext] ParticipantContext for this ParticipantInstance
              def context
                unless @instance_context
                  @instance_context = ParticipantContext.new(
                      @version,
                      @params['service_sid'],
                      @params['session_sid'],
                      @params['sid'],
                  )
                end
                @instance_context
              end

              ##
              # @return [String] A string that uniquely identifies this Participant.
              def sid
                @properties['sid']
              end

              ##
              # @return [String] Session Sid.
              def session_sid
                @properties['session_sid']
              end

              ##
              # @return [String] Service Sid.
              def service_sid
                @properties['service_sid']
              end

              ##
              # @return [String] Account Sid.
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] A human readable description of this resource.
              def friendly_name
                @properties['friendly_name']
              end

              ##
              # @return [participant.ParticipantType] The Participant Type of this Participant
              def participant_type
                @properties['participant_type']
              end

              ##
              # @return [String] The phone number of this Participant.
              def identifier
                @properties['identifier']
              end

              ##
              # @return [String] The proxy phone number for this Participant.
              def proxy_identifier
                @properties['proxy_identifier']
              end

              ##
              # @return [String] Proxy Identifier Sid.
              def proxy_identifier_sid
                @properties['proxy_identifier_sid']
              end

              ##
              # @return [Time] The date this Participant was deleted
              def date_deleted
                @properties['date_deleted']
              end

              ##
              # @return [Time] The date this Participant was created
              def date_created
                @properties['date_created']
              end

              ##
              # @return [Time] The date this Participant was updated
              def date_updated
                @properties['date_updated']
              end

              ##
              # @return [String] The URL of this resource.
              def url
                @properties['url']
              end

              ##
              # @return [String] Nested resource URLs.
              def links
                @properties['links']
              end

              ##
              # Fetch a ParticipantInstance
              # @return [ParticipantInstance] Fetched ParticipantInstance
              def fetch
                context.fetch
              end

              ##
              # Deletes the ParticipantInstance
              # @return [Boolean] true if delete succeeds, true otherwise
              def delete
                context.delete
              end

              ##
              # Update the ParticipantInstance
              # @param [participant.ParticipantType] participant_type The Participant Type of
              #   this Participant. One of `message-only`, `voice-only` or `voice-and-message`.
              # @param [String] identifier The phone number of this Participant.
              # @param [String] friendly_name A human readable description of this resource, up
              #   to 64 characters.
              # @param [String] proxy_identifier The proxy phone number for this Participant.
              # @param [String] proxy_identifier_sid The unique SID identifier of the Proxy
              #   Identifier.
              # @return [ParticipantInstance] Updated ParticipantInstance
              def update(participant_type: :unset, identifier: :unset, friendly_name: :unset, proxy_identifier: :unset, proxy_identifier_sid: :unset)
                context.update(
                    participant_type: participant_type,
                    identifier: identifier,
                    friendly_name: friendly_name,
                    proxy_identifier: proxy_identifier,
                    proxy_identifier_sid: proxy_identifier_sid,
                )
              end

              ##
              # Access the message_interactions
              # @return [message_interactions] message_interactions
              def message_interactions
                context.message_interactions
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Proxy.V1.ParticipantInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Proxy.V1.ParticipantInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end