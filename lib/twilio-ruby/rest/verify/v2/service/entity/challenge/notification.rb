##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Verify
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Verify < VerifyBase
            class V2 < Version
                class ServiceContext < InstanceContext
                class EntityContext < InstanceContext
                class ChallengeContext < InstanceContext

                     class NotificationList < ListResource
                
                    ##
                    # Initialize the NotificationList
                    # @param [Version] version Version that contains the resource
                    # @return [NotificationList] NotificationList
                    def initialize(version, service_sid: nil, identity: nil, challenge_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { service_sid: service_sid, identity: identity, challenge_sid: challenge_sid }
                        @uri = "/Services/#{@solution[:service_sid]}/Entities/#{@solution[:identity]}/Challenges/#{@solution[:challenge_sid]}/Notifications"
                        
                    end
                    ##
                    # Create the NotificationInstance
                    # @param [String] ttl How long, in seconds, the notification is valid. Can be an integer between 0 and 300. Default is 300. Delivery is attempted until the TTL elapses, even if the device is offline. 0 means that the notification delivery is attempted immediately, only once, and is not stored for future delivery.
                    # @return [NotificationInstance] Created NotificationInstance
                    def create(
                        ttl: :unset
                    )

                        data = Twilio::Values.of({
                            'Ttl' => ttl,
                        })

                        
                        payload = @version.create('POST', @uri, data: data)
                        NotificationInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            identity: @solution[:identity],
                            challenge_sid: @solution[:challenge_sid],
                        )
                    end

                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Verify.V2.NotificationList>'
                    end
                end

                class NotificationPage < Page
                    ##
                    # Initialize the NotificationPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
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
                        NotificationInstance.new(@version, payload, service_sid: @solution[:service_sid], identity: @solution[:identity], challenge_sid: @solution[:challenge_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Verify.V2.NotificationPage>'
                    end
                end
                class NotificationInstance < InstanceResource
                    ##
                    # Initialize the NotificationInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Notification
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [NotificationInstance] NotificationInstance
                    def initialize(version, payload , service_sid: nil, identity: nil, challenge_sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'service_sid' => payload['service_sid'],
                            'entity_sid' => payload['entity_sid'],
                            'identity' => payload['identity'],
                            'challenge_sid' => payload['challenge_sid'],
                            'priority' => payload['priority'],
                            'ttl' => payload['ttl'] == nil ? payload['ttl'] : payload['ttl'].to_i,
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                        }
                    end

                    
                    ##
                    # @return [String] A 34 character string that uniquely identifies this Notification.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The unique SID identifier of the Account.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The unique SID identifier of the Service.
                    def service_sid
                        @properties['service_sid']
                    end
                    
                    ##
                    # @return [String] The unique SID identifier of the Entity.
                    def entity_sid
                        @properties['entity_sid']
                    end
                    
                    ##
                    # @return [String] Customer unique identity for the Entity owner of the Challenge. This identifier should be immutable, not PII, length between 8 and 64 characters, and generated by your external system, such as your user's UUID, GUID, or SID. It can only contain dash (-) separated alphanumeric characters.
                    def identity
                        @properties['identity']
                    end
                    
                    ##
                    # @return [String] The unique SID identifier of the Challenge.
                    def challenge_sid
                        @properties['challenge_sid']
                    end
                    
                    ##
                    # @return [String] The priority of the notification. For `push` Challenges it's always `high` which sends the notification immediately, and can wake up a sleeping device.
                    def priority
                        @properties['priority']
                    end
                    
                    ##
                    # @return [String] How long, in seconds, the notification is valid. Max: 5 minutes
                    def ttl
                        @properties['ttl']
                    end
                    
                    ##
                    # @return [Time] The date that this Notification was created, given in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.Verify.V2.NotificationInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.Verify.V2.NotificationInstance>"
                    end
                end

             end
             end
             end
            end
        end
    end
end


