##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Sync
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Sync < SyncBase
            class V1 < Version
                class ServiceContext < InstanceContext

                     class DocumentList < ListResource
                
                    ##
                    # Initialize the DocumentList
                    # @param [Version] version Version that contains the resource
                    # @return [DocumentList] DocumentList
                    def initialize(version, service_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { service_sid: service_sid }
                        @uri = "/Services/#{@solution[:service_sid]}/Documents"
                        
                    end
                    ##
                    # Create the DocumentInstance
                    # @param [String] unique_name An application-defined string that uniquely identifies the Sync Document
                    # @param [Object] data A JSON string that represents an arbitrary, schema-less object that the Sync Document stores. Can be up to 16 KiB in length.
                    # @param [String] ttl How long, [in seconds](https://www.twilio.com/docs/sync/limits#sync-payload-limits), before the Sync Document expires and is deleted (the Sync Document's time-to-live).
                    # @return [DocumentInstance] Created DocumentInstance
                    def create(
                        unique_name: :unset, 
                        data: :unset, 
                        ttl: :unset
                    )

                        data = Twilio::Values.of({
                            'UniqueName' => unique_name,
                            'Data' => Twilio.serialize_object(data),
                            'Ttl' => ttl,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        DocumentInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                        )
                    end

                
                    ##
                    # Lists DocumentInstance records from the API as a list.
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
                    # When passed a block, yields DocumentInstance records from the API.
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
                    # Retrieve a single page of DocumentInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of DocumentInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        DocumentPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of DocumentInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of DocumentInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    DocumentPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Sync.V1.DocumentList>'
                    end
                end


                class DocumentContext < InstanceContext
                    ##
                    # Initialize the DocumentContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] service_sid The SID of the [Sync Service](https://www.twilio.com/docs/sync/api/service) with the Document resource to update.
                    # @param [String] sid The SID of the Document resource to update. Can be the Document resource's `sid` or its `unique_name`.
                    # @return [DocumentContext] DocumentContext
                    def initialize(version, service_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { service_sid: service_sid, sid: sid,  }
                        @uri = "/Services/#{@solution[:service_sid]}/Documents/#{@solution[:sid]}"

                        # Dependents
                        @document_permissions = nil
                    end
                    ##
                    # Delete the DocumentInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        @version.delete('DELETE', @uri, headers: headers)
                    end

                    ##
                    # Fetch the DocumentInstance
                    # @return [DocumentInstance] Fetched DocumentInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        DocumentInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the DocumentInstance
                    # @param [Object] data A JSON string that represents an arbitrary, schema-less object that the Sync Document stores. Can be up to 16 KiB in length.
                    # @param [String] ttl How long, [in seconds](https://www.twilio.com/docs/sync/limits#sync-payload-limits), before the Sync Document expires and is deleted (time-to-live).
                    # @param [String] if_match The If-Match HTTP request header
                    # @return [DocumentInstance] Updated DocumentInstance
                    def update(
                        data: :unset, 
                        ttl: :unset, 
                        if_match: :unset
                    )

                        data = Twilio::Values.of({
                            'Data' => Twilio.serialize_object(data),
                            'Ttl' => ttl,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', 'If-Match' => if_match, })
                        
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        DocumentInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Access the document_permissions
                    # @return [DocumentPermissionList]
                    # @return [DocumentPermissionContext] if sid was passed.
                    def document_permissions(identity=:unset)

                        raise ArgumentError, 'identity cannot be nil' if identity.nil?

                        if identity != :unset
                            return DocumentPermissionContext.new(@version, @solution[:service_sid], @solution[:sid],identity )
                        end

                        unless @document_permissions
                            @document_permissions = DocumentPermissionList.new(
                                @version, )
                        end

                     @document_permissions
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Sync.V1.DocumentContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Sync.V1.DocumentContext #{context}>"
                    end
                end

                class DocumentPage < Page
                    ##
                    # Initialize the DocumentPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [DocumentPage] DocumentPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of DocumentInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [DocumentInstance] DocumentInstance
                    def get_instance(payload)
                        DocumentInstance.new(@version, payload, service_sid: @solution[:service_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Sync.V1.DocumentPage>'
                    end
                end
                class DocumentInstance < InstanceResource
                    ##
                    # Initialize the DocumentInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Document
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [DocumentInstance] DocumentInstance
                    def initialize(version, payload , service_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'unique_name' => payload['unique_name'],
                            'account_sid' => payload['account_sid'],
                            'service_sid' => payload['service_sid'],
                            'url' => payload['url'],
                            'links' => payload['links'],
                            'revision' => payload['revision'],
                            'data' => payload['data'],
                            'date_expires' => Twilio.deserialize_iso8601_datetime(payload['date_expires']),
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'created_by' => payload['created_by'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'service_sid' => service_sid  || @properties['service_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [DocumentContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = DocumentContext.new(@version , @params['service_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the Document resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource and can be up to 320 characters long.
                    def unique_name
                        @properties['unique_name']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Document resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Sync Service](https://www.twilio.com/docs/sync/api/service) the resource is associated with.
                    def service_sid
                        @properties['service_sid']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the Document resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Hash] The URLs of resources related to the Sync Document.
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # @return [String] The current revision of the Sync Document, represented as a string. The `revision` property is used with conditional updates to ensure data consistency.
                    def revision
                        @properties['revision']
                    end
                    
                    ##
                    # @return [Hash] An arbitrary, schema-less object that the Sync Document stores. Can be up to 16 KiB in length.
                    def data
                        @properties['data']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the Sync Document expires and will be deleted, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format. If the Sync Document does not expire, this value is `null`. The Document resource might not be deleted immediately after it expires.
                    def date_expires
                        @properties['date_expires']
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
                    # @return [String] The identity of the Sync Document's creator. If the Sync Document is created from the client SDK, the value matches the Access Token's `identity` field. If the Sync Document was created from the REST API, the value is `system`.
                    def created_by
                        @properties['created_by']
                    end
                    
                    ##
                    # Delete the DocumentInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the DocumentInstance
                    # @return [DocumentInstance] Fetched DocumentInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the DocumentInstance
                    # @param [Object] data A JSON string that represents an arbitrary, schema-less object that the Sync Document stores. Can be up to 16 KiB in length.
                    # @param [String] ttl How long, [in seconds](https://www.twilio.com/docs/sync/limits#sync-payload-limits), before the Sync Document expires and is deleted (time-to-live).
                    # @param [String] if_match The If-Match HTTP request header
                    # @return [DocumentInstance] Updated DocumentInstance
                    def update(
                        data: :unset, 
                        ttl: :unset, 
                        if_match: :unset
                    )

                        context.update(
                            data: data, 
                            ttl: ttl, 
                            if_match: if_match, 
                        )
                    end

                    ##
                    # Access the document_permissions
                    # @return [document_permissions] document_permissions
                    def document_permissions
                        context.document_permissions
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Sync.V1.DocumentInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Sync.V1.DocumentInstance #{values}>"
                    end
                end

             end
            end
        end
    end
end


