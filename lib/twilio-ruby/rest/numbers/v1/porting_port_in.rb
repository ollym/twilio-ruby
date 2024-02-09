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
                class PortingPortInList < ListResource
                
                    ##
                    # Initialize the PortingPortInList
                    # @param [Version] version Version that contains the resource
                    # @return [PortingPortInList] PortingPortInList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Porting/PortIn"
                        
                    end
                    ##
                    # Create the PortingPortInInstance
                    # @return [PortingPortInInstance] Created PortingPortInInstance
                    def create

                        
                        payload = @version.create('POST', @uri)
                        PortingPortInInstance.new(
                            @version,
                            payload,
                        )
                    end

                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Numbers.V1.PortingPortInList>'
                    end
                end

                class PortingPortInPage < Page
                    ##
                    # Initialize the PortingPortInPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [PortingPortInPage] PortingPortInPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of PortingPortInInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [PortingPortInInstance] PortingPortInInstance
                    def get_instance(payload)
                        PortingPortInInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Numbers.V1.PortingPortInPage>'
                    end
                end
                class PortingPortInInstance < InstanceResource
                    ##
                    # Initialize the PortingPortInInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this PortingPortIn
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [PortingPortInInstance] PortingPortInInstance
                    def initialize(version, payload )
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'port_in_request_sid' => payload['port_in_request_sid'],
                            'url' => payload['url'],
                        }
                    end

                    
                    ##
                    # @return [String] The SID of the Port In request. This is a unique identifier of the port in request.
                    def port_in_request_sid
                        @properties['port_in_request_sid']
                    end
                    
                    ##
                    # @return [String] 
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.Numbers.V1.PortingPortInInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.Numbers.V1.PortingPortInInstance>"
                    end
                end

            end
        end
    end
end
