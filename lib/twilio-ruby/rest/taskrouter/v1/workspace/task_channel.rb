##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Taskrouter < Domain
      class V1 < Version
        class WorkspaceContext < InstanceContext
          class TaskChannelList < ListResource
            ##
            # Initialize the TaskChannelList
            # @param [Version] version Version that contains the resource
            # @param [String] workspace_sid The workspace_sid
            # @return [TaskChannelList] TaskChannelList
            def initialize(version, workspace_sid: nil)
              super(version)

              # Path Solution
              @solution = {
                  workspace_sid: workspace_sid
              }
              @uri = "/Workspaces/#{@solution[:workspace_sid]}/TaskChannels"
            end

            ##
            # Lists TaskChannelInstance records from the API as a list.
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
            # Streams TaskChannelInstance records from the API as an Enumerable.
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
            # When passed a block, yields TaskChannelInstance records from the API.
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
            # Retrieve a single page of TaskChannelInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of TaskChannelInstance
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
              return TaskChannelPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Taskrouter.V1.TaskChannelList>'
            end
          end

          class TaskChannelPage < Page
            ##
            # Initialize the TaskChannelPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @param [String] workspace_sid The workspace_sid
            # @return [TaskChannelPage] TaskChannelPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of TaskChannelInstance
            # @param [Hash] payload Payload response from the API
            # @return [TaskChannelInstance] TaskChannelInstance
            def get_instance(payload)
              return TaskChannelInstance.new(
                  @version,
                  payload,
                  workspace_sid: @solution[:workspace_sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Taskrouter.V1.TaskChannelPage>'
            end
          end

          class TaskChannelContext < InstanceContext
            ##
            # Initialize the TaskChannelContext
            # @param [Version] version Version that contains the resource
            # @param [String] workspace_sid The workspace_sid
            # @param [String] sid The sid
            # @return [TaskChannelContext] TaskChannelContext
            def initialize(version, workspace_sid, sid)
              super(version)

              # Path Solution
              @solution = {
                  workspace_sid: workspace_sid,
                  sid: sid,
              }
              @uri = "/Workspaces/#{@solution[:workspace_sid]}/TaskChannels/#{@solution[:sid]}"
            end

            ##
            # Fetch a TaskChannelInstance
            # @return [TaskChannelInstance] Fetched TaskChannelInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              return TaskChannelInstance.new(
                  @version,
                  payload,
                  workspace_sid: @solution[:workspace_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Taskrouter.V1.TaskChannelContext #{context}>"
            end
          end

          class TaskChannelInstance < InstanceResource
            ##
            # Initialize the TaskChannelInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] workspace_sid The workspace_sid
            # @param [String] sid The sid
            # @return [TaskChannelInstance] TaskChannelInstance
            def initialize(version, payload, workspace_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'date_created' => Twilio.deserialize_iso8601(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601(payload['date_updated']),
                  'friendly_name' => payload['friendly_name'],
                  'sid' => payload['sid'],
                  'unique_name' => payload['unique_name'],
                  'workspace_sid' => payload['workspace_sid'],
                  'url' => payload['url'],
              }

              # Context
              @instance_context = nil
              @params = {
                  'workspace_sid' => workspace_sid,
                  'sid' => sid || @properties['sid'],
              }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @param [Version] version Version that contains the resource
            # @return [TaskChannelContext] TaskChannelContext for this TaskChannelInstance
            def context
              unless @instance_context
                @instance_context = TaskChannelContext.new(
                    @version,
                    @params['workspace_sid'],
                    @params['sid'],
                )
              end
              @instance_context
            end

            def account_sid
              @properties['account_sid']
            end

            def date_created
              @properties['date_created']
            end

            def date_updated
              @properties['date_updated']
            end

            def friendly_name
              @properties['friendly_name']
            end

            def sid
              @properties['sid']
            end

            def unique_name
              @properties['unique_name']
            end

            def workspace_sid
              @properties['workspace_sid']
            end

            def url
              @properties['url']
            end

            ##
            # Fetch a TaskChannelInstance
            # @return [TaskChannelInstance] Fetched TaskChannelInstance
            def fetch
              context.fetch
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Taskrouter.V1.TaskChannelInstance #{values}>"
            end
          end
        end
      end
    end
  end
end