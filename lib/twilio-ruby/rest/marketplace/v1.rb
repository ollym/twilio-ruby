##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Marketplace
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#

module Twilio
    module REST
        class Marketplace
            class V1 < Version
                ##
                # Initialize the V1 version of Marketplace
                def initialize(domain)
                    super
                    @version = 'v1'
                    @available_add_ons = nil
                    @installed_add_ons = nil
                    @module_data_management = nil
                    @referral_conversion = nil
                end

                ##
                # @param [String] sid The SID of the AvailableAddOn resource to fetch.
                # @return [Twilio::REST::Marketplace::V1::AvailableAddOnContext] if sid was passed.
                # @return [Twilio::REST::Marketplace::V1::AvailableAddOnList]
                def available_add_ons(sid=:unset)
                    if sid.nil?
                        raise ArgumentError, 'sid cannot be nil'
                    end
                    if sid == :unset
                        @available_add_ons ||= AvailableAddOnList.new self
                    else
                        AvailableAddOnContext.new(self, sid)
                    end
                end
                ##
                # @param [String] sid The SID of the InstalledAddOn resource to fetch.
                # @return [Twilio::REST::Marketplace::V1::InstalledAddOnContext] if sid was passed.
                # @return [Twilio::REST::Marketplace::V1::InstalledAddOnList]
                def installed_add_ons(sid=:unset)
                    if sid.nil?
                        raise ArgumentError, 'sid cannot be nil'
                    end
                    if sid == :unset
                        @installed_add_ons ||= InstalledAddOnList.new self
                    else
                        InstalledAddOnContext.new(self, sid)
                    end
                end
                ##
                # @param [String] sid The unique identifier of a Listing.
                # @return [Twilio::REST::Marketplace::V1::ModuleDataManagementContext] if sid was passed.
                # @return [Twilio::REST::Marketplace::V1::ModuleDataManagementList]
                def module_data_management(sid=:unset)
                    if sid.nil?
                        raise ArgumentError, 'sid cannot be nil'
                    end
                    if sid == :unset
                        @module_data_management ||= ModuleDataManagementList.new self
                    else
                        ModuleDataManagementContext.new(self, sid)
                    end
                end
                ##
                # @return [Twilio::REST::Marketplace::V1::referralConversionContext]
                def referral_conversion
                    @referral_conversion ||= ReferralConversionContext.new self
                end
                ##
                # Provide a user friendly representation
                def to_s
                    '<Twilio::REST::Marketplace::V1>';
                end
            end
        end
    end
end
