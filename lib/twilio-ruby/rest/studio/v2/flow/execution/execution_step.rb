##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Studio
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Studio < StudioBase
            class V2 < Version
                class FlowContext < InstanceContext
                class ExecutionContext < InstanceContext

                     class ExecutionStepList < ListResource
                
                    ##
                    # Initialize the ExecutionStepList
                    # @param [Version] version Version that contains the resource
                    # @return [ExecutionStepList] ExecutionStepList
                    def initialize(version, flow_sid: nil, execution_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { flow_sid: flow_sid, execution_sid: execution_sid }
                        @uri = "/Flows/#{@solution[:flow_sid]}/Executions/#{@solution[:execution_sid]}/Steps"
                        
                    end
                
                    ##
                    # Lists ExecutionStepInstance records from the API as a list.
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
                    # When passed a block, yields ExecutionStepInstance records from the API.
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
                    # Retrieve a single page of ExecutionStepInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of ExecutionStepInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        ExecutionStepPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of ExecutionStepInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of ExecutionStepInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    ExecutionStepPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Studio.V2.ExecutionStepList>'
                    end
                end


                class ExecutionStepContext < InstanceContext
                    ##
                    # Initialize the ExecutionStepContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] flow_sid The SID of the Flow with the Step to fetch.
                    # @param [String] execution_sid The SID of the Execution resource with the Step to fetch.
                    # @param [String] sid The SID of the ExecutionStep resource to fetch.
                    # @return [ExecutionStepContext] ExecutionStepContext
                    def initialize(version, flow_sid, execution_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { flow_sid: flow_sid, execution_sid: execution_sid, sid: sid,  }
                        @uri = "/Flows/#{@solution[:flow_sid]}/Executions/#{@solution[:execution_sid]}/Steps/#{@solution[:sid]}"

                        # Dependents
                        @step_context = nil
                    end
                    ##
                    # Fetch the ExecutionStepInstance
                    # @return [ExecutionStepInstance] Fetched ExecutionStepInstance
                    def fetch

                        
                        payload = @version.fetch('GET', @uri)
                        ExecutionStepInstance.new(
                            @version,
                            payload,
                            flow_sid: @solution[:flow_sid],
                            execution_sid: @solution[:execution_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Access the step_context
                    # @return [ExecutionStepContextList]
                    # @return [ExecutionStepContextContext]
                    def step_context
                        ExecutionStepContextContext.new(
                                @version,
                                @solution[:flow_sid],
                                @solution[:execution_sid],
                                @solution[:sid]
                                )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Studio.V2.ExecutionStepContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Studio.V2.ExecutionStepContext #{context}>"
                    end
                end

                class ExecutionStepPage < Page
                    ##
                    # Initialize the ExecutionStepPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [ExecutionStepPage] ExecutionStepPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of ExecutionStepInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [ExecutionStepInstance] ExecutionStepInstance
                    def get_instance(payload)
                        ExecutionStepInstance.new(@version, payload, flow_sid: @solution[:flow_sid], execution_sid: @solution[:execution_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Studio.V2.ExecutionStepPage>'
                    end
                end
                class ExecutionStepInstance < InstanceResource
                    ##
                    # Initialize the ExecutionStepInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this ExecutionStep
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [ExecutionStepInstance] ExecutionStepInstance
                    def initialize(version, payload , flow_sid: nil, execution_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'flow_sid' => payload['flow_sid'],
                            'execution_sid' => payload['execution_sid'],
                            'name' => payload['name'],
                            'context' => payload['context'],
                            'transitioned_from' => payload['transitioned_from'],
                            'transitioned_to' => payload['transitioned_to'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'url' => payload['url'],
                            'links' => payload['links'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'flow_sid' => flow_sid  || @properties['flow_sid']  ,'execution_sid' => execution_sid  || @properties['execution_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [ExecutionStepContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = ExecutionStepContext.new(@version , @params['flow_sid'], @params['execution_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the ExecutionStep resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the ExecutionStep resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the Flow.
                    def flow_sid
                        @properties['flow_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the Step's Execution resource.
                    def execution_sid
                        @properties['execution_sid']
                    end
                    
                    ##
                    # @return [String] The event that caused the Flow to transition to the Step.
                    def name
                        @properties['name']
                    end
                    
                    ##
                    # @return [Hash] The current state of the Flow's Execution. As a flow executes, we save its state in this context. We save data that your widgets can access as variables in configuration fields or in text areas as variable substitution.
                    def context
                        @properties['context']
                    end
                    
                    ##
                    # @return [String] The Widget that preceded the Widget for the Step.
                    def transitioned_from
                        @properties['transitioned_from']
                    end
                    
                    ##
                    # @return [String] The Widget that will follow the Widget for the Step.
                    def transitioned_to
                        @properties['transitioned_to']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Hash] The URLs of related resources.
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # Fetch the ExecutionStepInstance
                    # @return [ExecutionStepInstance] Fetched ExecutionStepInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Access the step_context
                    # @return [step_context] step_context
                    def step_context
                        context.step_context
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Studio.V2.ExecutionStepInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Studio.V2.ExecutionStepInstance #{values}>"
                    end
                end

             end
             end
            end
        end
    end
end


