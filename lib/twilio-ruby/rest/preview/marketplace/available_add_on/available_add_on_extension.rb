##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Preview < Domain
      class Marketplace < Version
        class AvailableAddOnContext < InstanceContext
          class AvailableAddOnExtensionList < ListResource
            ##
            # Initialize the AvailableAddOnExtensionList
            # @param [Version] version Version that contains the resource
            # @param [String] available_add_on_sid The available_add_on_sid
            # @return [AvailableAddOnExtensionList] AvailableAddOnExtensionList
            def initialize(version, available_add_on_sid: nil)
              super(version)

              # Path Solution
              @solution = {
                  available_add_on_sid: available_add_on_sid
              }
              @uri = "/AvailableAddOns/#{@solution[:available_add_on_sid]}/Extensions"
            end

            ##
            # Lists AvailableAddOnExtensionInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #                   guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
            #  the default value of 50 records.  If no page_size is                      defined
            #  but a limit is defined, stream() will attempt to read                      the
            #  limit with the most efficient page size,                      i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(limit: nil, page_size: nil)
              self.stream(
                  limit: limit,
                  page_size: page_size
              ).entries
            end

            ##
            # Streams AvailableAddOnExtensionInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Integer] limit Upper limit for the number of records to return.                  stream()
            #  guarantees to never return more than limit.                  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
            #  the default value of 50 records.                      If no page_size is defined
            #                       but a limit is defined, stream() will attempt to                      read the
            #  limit with the most efficient page size,                       i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(
                  page_size: limits[:page_size],
              )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields AvailableAddOnExtensionInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
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
            # Retrieve a single page of AvailableAddOnExtensionInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of AvailableAddOnExtensionInstance
            def page(page_token: Twilio::Values::Unset, page_number: Twilio::Values::Unset, page_size: Twilio::Values.Unset)
              params = Twilio::Values.of({
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              return AvailableAddOnExtensionPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Preview.Marketplace.AvailableAddOnExtensionList>'
            end
          end

          class AvailableAddOnExtensionPage < Page
            ##
            # Initialize the AvailableAddOnExtensionPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @param [String] available_add_on_sid The available_add_on_sid
            # @return [AvailableAddOnExtensionPage] AvailableAddOnExtensionPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of AvailableAddOnExtensionInstance
            # @param [Hash] payload Payload response from the API
            # @return [AvailableAddOnExtensionInstance] AvailableAddOnExtensionInstance
            def get_instance(payload)
              return AvailableAddOnExtensionInstance.new(
                  @version,
                  payload,
                  available_add_on_sid: @solution[:available_add_on_sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Preview.Marketplace.AvailableAddOnExtensionPage>'
            end
          end

          class AvailableAddOnExtensionContext < InstanceContext
            ##
            # Initialize the AvailableAddOnExtensionContext
            # @param [Version] version Version that contains the resource
            # @param [String] available_add_on_sid The available_add_on_sid
            # @param [String] sid The Extension Sid that uniquely identifies this resource
            # @return [AvailableAddOnExtensionContext] AvailableAddOnExtensionContext
            def initialize(version, available_add_on_sid, sid)
              super(version)

              # Path Solution
              @solution = {
                  available_add_on_sid: available_add_on_sid,
                  sid: sid,
              }
              @uri = "/AvailableAddOns/#{@solution[:available_add_on_sid]}/Extensions/#{@solution[:sid]}"
            end

            ##
            # Fetch a AvailableAddOnExtensionInstance
            # @return [AvailableAddOnExtensionInstance] Fetched AvailableAddOnExtensionInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              return AvailableAddOnExtensionInstance.new(
                  @version,
                  payload,
                  available_add_on_sid: @solution[:available_add_on_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Preview.Marketplace.AvailableAddOnExtensionContext #{context}>"
            end
          end

          class AvailableAddOnExtensionInstance < InstanceResource
            ##
            # Initialize the AvailableAddOnExtensionInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] available_add_on_sid The available_add_on_sid
            # @param [String] sid The Extension Sid that uniquely identifies this resource
            # @return [AvailableAddOnExtensionInstance] AvailableAddOnExtensionInstance
            def initialize(version, payload, available_add_on_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'available_add_on_sid' => payload['available_add_on_sid'],
                  'friendly_name' => payload['friendly_name'],
                  'product_name' => payload['product_name'],
                  'unique_name' => payload['unique_name'],
                  'url' => payload['url'],
              }

              # Context
              @instance_context = nil
              @params = {
                  'available_add_on_sid' => available_add_on_sid,
                  'sid' => sid || @properties['sid'],
              }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @param [Version] version Version that contains the resource
            # @return [AvailableAddOnExtensionContext] AvailableAddOnExtensionContext for this AvailableAddOnExtensionInstance
            def context
              unless @instance_context
                @instance_context = AvailableAddOnExtensionContext.new(
                    @version,
                    @params['available_add_on_sid'],
                    @params['sid'],
                )
              end
              @instance_context
            end

            def sid
              @properties['sid']
            end

            def available_add_on_sid
              @properties['available_add_on_sid']
            end

            def friendly_name
              @properties['friendly_name']
            end

            def product_name
              @properties['product_name']
            end

            def unique_name
              @properties['unique_name']
            end

            def url
              @properties['url']
            end

            ##
            # Fetch a AvailableAddOnExtensionInstance
            # @return [AvailableAddOnExtensionInstance] Fetched AvailableAddOnExtensionInstance
            def fetch
              context.fetch
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Preview.Marketplace.AvailableAddOnExtensionInstance #{values}>"
            end
          end
        end
      end
    end
  end
end