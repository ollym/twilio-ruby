##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Flex
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class FlexApi < FlexApiBase
            class V1 < Version
                class InsightsQuestionnairesList < ListResource
                
                    ##
                    # Initialize the InsightsQuestionnairesList
                    # @param [Version] version Version that contains the resource
                    # @return [InsightsQuestionnairesList] InsightsQuestionnairesList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Insights/QualityManagement/Questionnaires"
                        
                    end
                    ##
                    # Create the InsightsQuestionnairesInstance
                    # @param [String] name The name of this questionnaire
                    # @param [String] description The description of this questionnaire
                    # @param [Boolean] active The flag to enable or disable questionnaire
                    # @param [Array[String]] question_sids The list of questions sids under a questionnaire
                    # @param [String] authorization The Authorization HTTP request header
                    # @return [InsightsQuestionnairesInstance] Created InsightsQuestionnairesInstance
                    def create(
                        name: nil, 
                        description: :unset, 
                        active: :unset, 
                        question_sids: :unset, 
                        authorization: :unset
                    )

                        data = Twilio::Values.of({
                            'Name' => name,
                            'Description' => description,
                            'Active' => active,
                            'QuestionSids' => Twilio.serialize_list(question_sids) { |e| e },
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', 'Authorization' => authorization, })
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        InsightsQuestionnairesInstance.new(
                            @version,
                            payload,
                        )
                    end

                
                    ##
                    # Lists InsightsQuestionnairesInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [String] authorization The Authorization HTTP request header
                    # @param [Boolean] include_inactive Flag indicating whether to include inactive questionnaires or not
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(authorization: :unset, include_inactive: :unset, limit: nil, page_size: nil)
                        self.stream(
                            authorization: authorization,
                            include_inactive: include_inactive,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [String] authorization The Authorization HTTP request header
                    # @param [Boolean] include_inactive Flag indicating whether to include inactive questionnaires or not
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(authorization: :unset, include_inactive: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            authorization: authorization,
                            include_inactive: include_inactive,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields InsightsQuestionnairesInstance records from the API.
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
                    # Retrieve a single page of InsightsQuestionnairesInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] authorization The Authorization HTTP request header
                    # @param [Boolean] include_inactive Flag indicating whether to include inactive questionnaires or not
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of InsightsQuestionnairesInstance
                    def page(authorization: :unset, include_inactive: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'Authorization' => authorization,
                            'IncludeInactive' => include_inactive,
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        InsightsQuestionnairesPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of InsightsQuestionnairesInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of InsightsQuestionnairesInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    InsightsQuestionnairesPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.FlexApi.V1.InsightsQuestionnairesList>'
                    end
                end


                class InsightsQuestionnairesContext < InstanceContext
                    ##
                    # Initialize the InsightsQuestionnairesContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] questionnaire_sid The SID of the questionnaire
                    # @return [InsightsQuestionnairesContext] InsightsQuestionnairesContext
                    def initialize(version, questionnaire_sid)
                        super(version)

                        # Path Solution
                        @solution = { questionnaire_sid: questionnaire_sid,  }
                        @uri = "/Insights/QualityManagement/Questionnaires/#{@solution[:questionnaire_sid]}"

                        
                    end
                    ##
                    # Delete the InsightsQuestionnairesInstance
                    # @param [String] authorization The Authorization HTTP request header
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete(
                        authorization: :unset
                    )

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', 'Authorization' => authorization, })
                        
                        @version.delete('DELETE', @uri, headers: headers)
                    end

                    ##
                    # Fetch the InsightsQuestionnairesInstance
                    # @param [String] authorization The Authorization HTTP request header
                    # @return [InsightsQuestionnairesInstance] Fetched InsightsQuestionnairesInstance
                    def fetch(
                        authorization: :unset
                    )

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', 'Authorization' => authorization, })
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        InsightsQuestionnairesInstance.new(
                            @version,
                            payload,
                            questionnaire_sid: @solution[:questionnaire_sid],
                        )
                    end

                    ##
                    # Update the InsightsQuestionnairesInstance
                    # @param [Boolean] active The flag to enable or disable questionnaire
                    # @param [String] name The name of this questionnaire
                    # @param [String] description The description of this questionnaire
                    # @param [Array[String]] question_sids The list of questions sids under a questionnaire
                    # @param [String] authorization The Authorization HTTP request header
                    # @return [InsightsQuestionnairesInstance] Updated InsightsQuestionnairesInstance
                    def update(
                        active: nil, 
                        name: :unset, 
                        description: :unset, 
                        question_sids: :unset, 
                        authorization: :unset
                    )

                        data = Twilio::Values.of({
                            'Active' => active,
                            'Name' => name,
                            'Description' => description,
                            'QuestionSids' => Twilio.serialize_list(question_sids) { |e| e },
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', 'Authorization' => authorization, })
                        
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        InsightsQuestionnairesInstance.new(
                            @version,
                            payload,
                            questionnaire_sid: @solution[:questionnaire_sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.FlexApi.V1.InsightsQuestionnairesContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.FlexApi.V1.InsightsQuestionnairesContext #{context}>"
                    end
                end

                class InsightsQuestionnairesPage < Page
                    ##
                    # Initialize the InsightsQuestionnairesPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [InsightsQuestionnairesPage] InsightsQuestionnairesPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of InsightsQuestionnairesInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [InsightsQuestionnairesInstance] InsightsQuestionnairesInstance
                    def get_instance(payload)
                        InsightsQuestionnairesInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.FlexApi.V1.InsightsQuestionnairesPage>'
                    end
                end
                class InsightsQuestionnairesInstance < InstanceResource
                    ##
                    # Initialize the InsightsQuestionnairesInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this InsightsQuestionnaires
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [InsightsQuestionnairesInstance] InsightsQuestionnairesInstance
                    def initialize(version, payload , questionnaire_sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'questionnaire_sid' => payload['questionnaire_sid'],
                            'name' => payload['name'],
                            'description' => payload['description'],
                            'active' => payload['active'],
                            'questions' => payload['questions'],
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'questionnaire_sid' => questionnaire_sid  || @properties['questionnaire_sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [InsightsQuestionnairesContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = InsightsQuestionnairesContext.new(@version , @params['questionnaire_sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Flex Insights resource and owns this resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The sid of this questionnaire
                    def questionnaire_sid
                        @properties['questionnaire_sid']
                    end
                    
                    ##
                    # @return [String] The name of this category.
                    def name
                        @properties['name']
                    end
                    
                    ##
                    # @return [String] The description of this questionnaire
                    def description
                        @properties['description']
                    end
                    
                    ##
                    # @return [Boolean] The flag to enable or disable questionnaire
                    def active
                        @properties['active']
                    end
                    
                    ##
                    # @return [Array<Hash>] The list of questions with category for a questionnaire
                    def questions
                        @properties['questions']
                    end
                    
                    ##
                    # @return [String] 
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Delete the InsightsQuestionnairesInstance
                    # @param [String] authorization The Authorization HTTP request header
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete(
                        authorization: :unset
                    )

                        context.delete(
                            authorization: authorization, 
                        )
                    end

                    ##
                    # Fetch the InsightsQuestionnairesInstance
                    # @param [String] authorization The Authorization HTTP request header
                    # @return [InsightsQuestionnairesInstance] Fetched InsightsQuestionnairesInstance
                    def fetch(
                        authorization: :unset
                    )

                        context.fetch(
                            authorization: authorization, 
                        )
                    end

                    ##
                    # Update the InsightsQuestionnairesInstance
                    # @param [Boolean] active The flag to enable or disable questionnaire
                    # @param [String] name The name of this questionnaire
                    # @param [String] description The description of this questionnaire
                    # @param [Array[String]] question_sids The list of questions sids under a questionnaire
                    # @param [String] authorization The Authorization HTTP request header
                    # @return [InsightsQuestionnairesInstance] Updated InsightsQuestionnairesInstance
                    def update(
                        active: nil, 
                        name: :unset, 
                        description: :unset, 
                        question_sids: :unset, 
                        authorization: :unset
                    )

                        context.update(
                            active: active, 
                            name: name, 
                            description: description, 
                            question_sids: question_sids, 
                            authorization: authorization, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.FlexApi.V1.InsightsQuestionnairesInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.FlexApi.V1.InsightsQuestionnairesInstance #{values}>"
                    end
                end

            end
        end
    end
end
