##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class AvailablePhoneNumberCountryList < ListResource
            ##
            # Initialize the AvailablePhoneNumberCountryList
            # @param [Version] version Version that contains the resource
            # @param [String] account_sid A 34 character string that uniquely identifies this
            #   resource.
            # @return [AvailablePhoneNumberCountryList] AvailablePhoneNumberCountryList
            def initialize(version, account_sid: nil)
              super(version)

              # Path Solution
              @solution = {
                  account_sid: account_sid
              }
              @uri = "/Accounts/#{@solution[:account_sid]}/AvailablePhoneNumbers.json"
            end

            ##
            # Lists AvailablePhoneNumberCountryInstance records from the API as a list.
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
            # Streams AvailablePhoneNumberCountryInstance records from the API as an Enumerable.
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
            # When passed a block, yields AvailablePhoneNumberCountryInstance records from the API.
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
            # Retrieve a single page of AvailablePhoneNumberCountryInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of AvailablePhoneNumberCountryInstance
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
              return AvailablePhoneNumberCountryPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Api.V2010.AvailablePhoneNumberCountryList>'
            end
          end

          class AvailablePhoneNumberCountryPage < Page
            ##
            # Initialize the AvailablePhoneNumberCountryPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @param [String] account_sid A 34 character string that uniquely identifies this
            #   resource.
            # @return [AvailablePhoneNumberCountryPage] AvailablePhoneNumberCountryPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of AvailablePhoneNumberCountryInstance
            # @param [Hash] payload Payload response from the API
            # @return [AvailablePhoneNumberCountryInstance] AvailablePhoneNumberCountryInstance
            def get_instance(payload)
              return AvailablePhoneNumberCountryInstance.new(
                  @version,
                  payload,
                  account_sid: @solution[:account_sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Api.V2010.AvailablePhoneNumberCountryPage>'
            end
          end

          class AvailablePhoneNumberCountryContext < InstanceContext
            ##
            # Initialize the AvailablePhoneNumberCountryContext
            # @param [Version] version Version that contains the resource
            # @param [String] account_sid The account_sid
            # @param [String] country_code The country_code
            # @return [AvailablePhoneNumberCountryContext] AvailablePhoneNumberCountryContext
            def initialize(version, account_sid, country_code)
              super(version)

              # Path Solution
              @solution = {
                  account_sid: account_sid,
                  country_code: country_code,
              }
              @uri = "/Accounts/#{@solution[:account_sid]}/AvailablePhoneNumbers/#{@solution[:country_code]}.json"

              # Dependents
              @local = nil
              @toll_free = nil
              @mobile = nil
            end

            ##
            # Fetch a AvailablePhoneNumberCountryInstance
            # @return [AvailablePhoneNumberCountryInstance] Fetched AvailablePhoneNumberCountryInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              return AvailablePhoneNumberCountryInstance.new(
                  @version,
                  payload,
                  account_sid: @solution[:account_sid],
                  country_code: @solution[:country_code],
              )
            end

            ##
            # Access the local
            # @return [LocalList] LocalList
            def local
              unless @local
                @local = LocalList.new(
                    @version,
                    account_sid: @solution[:account_sid],
                    country_code: @solution[:country_code],
                )
              end

              @local
            end

            ##
            # Access the toll_free
            # @return [TollFreeList] TollFreeList
            def toll_free
              unless @toll_free
                @toll_free = TollFreeList.new(
                    @version,
                    account_sid: @solution[:account_sid],
                    country_code: @solution[:country_code],
                )
              end

              @toll_free
            end

            ##
            # Access the mobile
            # @return [MobileList] MobileList
            def mobile
              unless @mobile
                @mobile = MobileList.new(
                    @version,
                    account_sid: @solution[:account_sid],
                    country_code: @solution[:country_code],
                )
              end

              @mobile
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Api.V2010.AvailablePhoneNumberCountryContext #{context}>"
            end
          end

          class AvailablePhoneNumberCountryInstance < InstanceResource
            ##
            # Initialize the AvailablePhoneNumberCountryInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] account_sid A 34 character string that uniquely identifies this
            #   resource.
            # @param [String] country_code The country_code
            # @return [AvailablePhoneNumberCountryInstance] AvailablePhoneNumberCountryInstance
            def initialize(version, payload, account_sid: nil, country_code: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'country_code' => payload['country_code'],
                  'country' => payload['country'],
                  'uri' => payload['uri'],
                  'beta' => payload['beta'],
                  'subresource_uris' => payload['subresource_uris'],
              }

              # Context
              @instance_context = nil
              @params = {
                  'account_sid' => account_sid,
                  'country_code' => country_code || @properties['country_code'],
              }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @param [Version] version Version that contains the resource
            # @return [AvailablePhoneNumberCountryContext] AvailablePhoneNumberCountryContext for this AvailablePhoneNumberCountryInstance
            def context
              unless @instance_context
                @instance_context = AvailablePhoneNumberCountryContext.new(
                    @version,
                    @params['account_sid'],
                    @params['country_code'],
                )
              end
              @instance_context
            end

            def country_code
              @properties['country_code']
            end

            def country
              @properties['country']
            end

            def uri
              @properties['uri']
            end

            def beta
              @properties['beta']
            end

            def subresource_uris
              @properties['subresource_uris']
            end

            ##
            # Fetch a AvailablePhoneNumberCountryInstance
            # @return [AvailablePhoneNumberCountryInstance] Fetched AvailablePhoneNumberCountryInstance
            def fetch
              context.fetch
            end

            ##
            # Access the local
            # @return [local] local
            def local
              context.local
            end

            ##
            # Access the toll_free
            # @return [toll_free] toll_free
            def toll_free
              context.toll_free
            end

            ##
            # Access the mobile
            # @return [mobile] mobile
            def mobile
              context.mobile
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Api.V2010.AvailablePhoneNumberCountryInstance #{values}>"
            end
          end
        end
      end
    end
  end
end