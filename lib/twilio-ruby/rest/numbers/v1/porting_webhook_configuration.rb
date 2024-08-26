##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Numbers
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Numbers < NumbersBase
            class V1 < Version
                class PortingWebhookConfigurationList < ListResource
                
                    ##
                    # Initialize the PortingWebhookConfigurationList
                    # @param [Version] version Version that contains the resource
                    # @return [PortingWebhookConfigurationList] PortingWebhookConfigurationList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Porting/Configuration/Webhook"
                        
                    end
                    ##
                    # Create the PortingWebhookConfigurationInstance
                    # @param [Object] body 
                    # @return [PortingWebhookConfigurationInstance] Created PortingWebhookConfigurationInstance
                    def create(body: :unset
                    )

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        headers['Content-Type'] = 'application/json'
                        payload = @version.create('POST', @uri, headers: headers, data: body.to_json)
                        PortingWebhookConfigurationInstance.new(
                            @version,
                            payload,
                        )
                    end

                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Numbers.V1.PortingWebhookConfigurationList>'
                    end
                end

                class PortingWebhookConfigurationPage < Page
                    ##
                    # Initialize the PortingWebhookConfigurationPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [PortingWebhookConfigurationPage] PortingWebhookConfigurationPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of PortingWebhookConfigurationInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [PortingWebhookConfigurationInstance] PortingWebhookConfigurationInstance
                    def get_instance(payload)
                        PortingWebhookConfigurationInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Numbers.V1.PortingWebhookConfigurationPage>'
                    end
                end
                class PortingWebhookConfigurationInstance < InstanceResource
                    ##
                    # Initialize the PortingWebhookConfigurationInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this PortingWebhookConfiguration
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [PortingWebhookConfigurationInstance] PortingWebhookConfigurationInstance
                    def initialize(version, payload )
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'url' => payload['url'],
                            'port_in_target_url' => payload['port_in_target_url'],
                            'port_out_target_url' => payload['port_out_target_url'],
                            'notifications_of' => payload['notifications_of'],
                        }
                    end

                    
                    ##
                    # @return [String] The URL of the webhook configuration request
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [String] The complete webhook url that will be called when a notification event for port in request or port in phone number happens
                    def port_in_target_url
                        @properties['port_in_target_url']
                    end
                    
                    ##
                    # @return [String] The complete webhook url that will be called when a notification event for a port out phone number happens.
                    def port_out_target_url
                        @properties['port_out_target_url']
                    end
                    
                    ##
                    # @return [Array<String>] A list to filter what notification events to receive for this account and its sub accounts. If it is an empty list, then it means that there are no filters for the notifications events to send in each webhook and all events will get sent.
                    def notifications_of
                        @properties['notifications_of']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.Numbers.V1.PortingWebhookConfigurationInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.Numbers.V1.PortingWebhookConfigurationInstance>"
                    end
                end

            end
        end
    end
end
