##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Proxy
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Proxy < ProxyBase
            class V1 < Version
                class ServiceContext < InstanceContext
                class SessionContext < InstanceContext
                class ParticipantContext < InstanceContext

                     class MessageInteractionList < ListResource
                
                    ##
                    # Initialize the MessageInteractionList
                    # @param [Version] version Version that contains the resource
                    # @return [MessageInteractionList] MessageInteractionList
                    def initialize(version, service_sid: nil, session_sid: nil, participant_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { service_sid: service_sid, session_sid: session_sid, participant_sid: participant_sid }
                        @uri = "/Services/#{@solution[:service_sid]}/Sessions/#{@solution[:session_sid]}/Participants/#{@solution[:participant_sid]}/MessageInteractions"
                        
                    end
                    ##
                    # Create the MessageInteractionInstance
                    # @param [String] body The message to send to the participant
                    # @param [Array[String]] media_url Reserved. Not currently supported.
                    # @return [MessageInteractionInstance] Created MessageInteractionInstance
                    def create(
                        body: :unset, 
                        media_url: :unset
                    )

                        data = Twilio::Values.of({
                            'Body' => body,
                            'MediaUrl' => Twilio.serialize_list(media_url) { |e| e },
                        })

                        
                        payload = @version.create('POST', @uri, data: data)
                        MessageInteractionInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            session_sid: @solution[:session_sid],
                            participant_sid: @solution[:participant_sid],
                        )
                    end

                
                    ##
                    # Lists MessageInteractionInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(limit: nil, page_size: nil)
                        self.stream(
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields MessageInteractionInstance records from the API.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    def each
                        limits = @version.read_limits

                        page = self.page(page_size: limits[:page_size], )

                        @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
                    end

                    ##
                    # Retrieve a single page of MessageInteractionInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of MessageInteractionInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        MessageInteractionPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of MessageInteractionInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of MessageInteractionInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    MessageInteractionPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Proxy.V1.MessageInteractionList>'
                    end
                end


                class MessageInteractionContext < InstanceContext
                    ##
                    # Initialize the MessageInteractionContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] service_sid The SID of the parent [Service](https://www.twilio.com/docs/proxy/api/service) of the resource to fetch.
                    # @param [String] session_sid The SID of the parent [Session](https://www.twilio.com/docs/proxy/api/session) of the resource to fetch.
                    # @param [String] participant_sid The SID of the [Participant](https://www.twilio.com/docs/proxy/api/participant) resource.
                    # @param [String] sid The Twilio-provided string that uniquely identifies the MessageInteraction resource to fetch.
                    # @return [MessageInteractionContext] MessageInteractionContext
                    def initialize(version, service_sid, session_sid, participant_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { service_sid: service_sid, session_sid: session_sid, participant_sid: participant_sid, sid: sid,  }
                        @uri = "/Services/#{@solution[:service_sid]}/Sessions/#{@solution[:session_sid]}/Participants/#{@solution[:participant_sid]}/MessageInteractions/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Fetch the MessageInteractionInstance
                    # @return [MessageInteractionInstance] Fetched MessageInteractionInstance
                    def fetch

                        
                        payload = @version.fetch('GET', @uri)
                        MessageInteractionInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            session_sid: @solution[:session_sid],
                            participant_sid: @solution[:participant_sid],
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Proxy.V1.MessageInteractionContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Proxy.V1.MessageInteractionContext #{context}>"
                    end
                end

                class MessageInteractionPage < Page
                    ##
                    # Initialize the MessageInteractionPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [MessageInteractionPage] MessageInteractionPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of MessageInteractionInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [MessageInteractionInstance] MessageInteractionInstance
                    def get_instance(payload)
                        MessageInteractionInstance.new(@version, payload, service_sid: @solution[:service_sid], session_sid: @solution[:session_sid], participant_sid: @solution[:participant_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Proxy.V1.MessageInteractionPage>'
                    end
                end
                class MessageInteractionInstance < InstanceResource
                    ##
                    # Initialize the MessageInteractionInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this MessageInteraction
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [MessageInteractionInstance] MessageInteractionInstance
                    def initialize(version, payload , service_sid: nil, session_sid: nil, participant_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'session_sid' => payload['session_sid'],
                            'service_sid' => payload['service_sid'],
                            'account_sid' => payload['account_sid'],
                            'data' => payload['data'],
                            'type' => payload['type'],
                            'participant_sid' => payload['participant_sid'],
                            'inbound_participant_sid' => payload['inbound_participant_sid'],
                            'inbound_resource_sid' => payload['inbound_resource_sid'],
                            'inbound_resource_status' => payload['inbound_resource_status'],
                            'inbound_resource_type' => payload['inbound_resource_type'],
                            'inbound_resource_url' => payload['inbound_resource_url'],
                            'outbound_participant_sid' => payload['outbound_participant_sid'],
                            'outbound_resource_sid' => payload['outbound_resource_sid'],
                            'outbound_resource_status' => payload['outbound_resource_status'],
                            'outbound_resource_type' => payload['outbound_resource_type'],
                            'outbound_resource_url' => payload['outbound_resource_url'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'service_sid' => service_sid  || @properties['service_sid']  ,'session_sid' => session_sid  || @properties['session_sid']  ,'participant_sid' => participant_sid  || @properties['participant_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [MessageInteractionContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = MessageInteractionContext.new(@version , @params['service_sid'], @params['session_sid'], @params['participant_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the MessageInteraction resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the parent [Session](https://www.twilio.com/docs/proxy/api/session) resource.
                    def session_sid
                        @properties['session_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the parent [Service](https://www.twilio.com/docs/proxy/api/service) resource.
                    def service_sid
                        @properties['service_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the MessageInteraction resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] A JSON string that includes the message body sent to the participant. (e.g. `{\"body\": \"hello\"}`)
                    def data
                        @properties['data']
                    end
                    
                    ##
                    # @return [Type] 
                    def type
                        @properties['type']
                    end
                    
                    ##
                    # @return [String] The SID of the [Participant](https://www.twilio.com/docs/proxy/api/participant) resource.
                    def participant_sid
                        @properties['participant_sid']
                    end
                    
                    ##
                    # @return [String] Always empty for created Message Interactions.
                    def inbound_participant_sid
                        @properties['inbound_participant_sid']
                    end
                    
                    ##
                    # @return [String] Always empty for created Message Interactions.
                    def inbound_resource_sid
                        @properties['inbound_resource_sid']
                    end
                    
                    ##
                    # @return [ResourceStatus] 
                    def inbound_resource_status
                        @properties['inbound_resource_status']
                    end
                    
                    ##
                    # @return [String] Always empty for created Message Interactions.
                    def inbound_resource_type
                        @properties['inbound_resource_type']
                    end
                    
                    ##
                    # @return [String] Always empty for created Message Interactions.
                    def inbound_resource_url
                        @properties['inbound_resource_url']
                    end
                    
                    ##
                    # @return [String] The SID of the outbound [Participant](https://www.twilio.com/docs/proxy/api/participant) resource.
                    def outbound_participant_sid
                        @properties['outbound_participant_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the outbound [Message](https://www.twilio.com/docs/sms/api/message-resource) resource.
                    def outbound_resource_sid
                        @properties['outbound_resource_sid']
                    end
                    
                    ##
                    # @return [ResourceStatus] 
                    def outbound_resource_status
                        @properties['outbound_resource_status']
                    end
                    
                    ##
                    # @return [String] The outbound resource type. This value is always `Message`.
                    def outbound_resource_type
                        @properties['outbound_resource_type']
                    end
                    
                    ##
                    # @return [String] The URL of the Twilio message resource.
                    def outbound_resource_url
                        @properties['outbound_resource_url']
                    end
                    
                    ##
                    # @return [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time in GMT when the resource was created.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time in GMT when the resource was last updated.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the MessageInteraction resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Fetch the MessageInteractionInstance
                    # @return [MessageInteractionInstance] Fetched MessageInteractionInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Proxy.V1.MessageInteractionInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Proxy.V1.MessageInteractionInstance #{values}>"
                    end
                end

             end
             end
             end
            end
        end
    end
end


