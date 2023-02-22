##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'InsightsSegments' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.flex_api.v1.insights_segments('segment_id').fetch(token: 'token')
    }.to raise_exception(Twilio::REST::TwilioError)

    headers = {'Token' => 'token', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://flex-api.twilio.com/v1/Insights/Segments/segment_id',
        headers: headers,
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "segment_id": "02dd8a65-c9e3-550b-9e98-5b11abb9b3a4",
          "external_id": "EV4ab3c50aeeb9dc48c96f7290cf626a37",
          "queue": "Everyone",
          "external_contact": "+13051515226",
          "external_segment_link_id": null,
          "date": "2022-02-08T08:00:00Z",
          "account_id": "76e4c1c3-6f93-5d08-ae66-aad4b9092f2d",
          "external_segment_link": null,
          "agent_id": "0e4a8059-18a3-5e48-9efb-29ae3213e7fe",
          "agent_phone": "+13051515226",
          "agent_name": "Flex Insights",
          "agent_team_name": "Everyone",
          "agent_team_name_in_hierarchy": "Everyone",
          "agent_link": null,
          "customer_phone": "+420606078007",
          "customer_name": "+420606078007",
          "customer_link": null,
          "segment_recording_offset": null,
          "media": null,
          "assessment_type": [
              null
          ],
          "assessment_percentage": [
              null
          ],
          "url": "https://flex-api.twilio.com/v1/Insights/Segments/02dd8a65-c9e3-550b-9e98-5b11abb9b3a4"
      }
      ]
    ))

    actual = @client.flex_api.v1.insights_segments('segment_id').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.flex_api.v1.insights_segments.list(token: 'token')
    }.to raise_exception(Twilio::REST::TwilioError)

    headers = {'Token' => 'token', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://flex-api.twilio.com/v1/Insights/Segments',
        headers: headers,
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "segments": [],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://flex-api.twilio.com/v1/Insights/Segments?ReservationId=WReeeff42d5326cfdaa0f7a1181d00f1b1&PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://flex-api.twilio.com/v1/Insights/Segments?ReservationId=WReeeff42d5326cfdaa0f7a1181d00f1b1&PageSize=50&Page=0",
              "next_page_url": null,
              "key": "segments"
          }
      }
      ]
    ))

    actual = @client.flex_api.v1.insights_segments.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "segments": [
              {
                  "segment_id": "02dd8a65-c9e3-550b-9e98-5b11abb9b3a5",
                  "external_id": "EV4ab3c50aeeb9dc48c96f7290cf626a37",
                  "queue": "Everyone",
                  "external_contact": "+13051515226",
                  "external_segment_link_id": null,
                  "date": "2022-02-08T08:00:00Z",
                  "account_id": "76e4c1c3-6f93-5d08-ae66-aad4b9092f2d",
                  "external_segment_link": null,
                  "agent_id": "0e4a8059-18a3-5e48-9efb-29ae3213e7fe",
                  "agent_phone": "+13051515226",
                  "agent_name": "Flex Insights",
                  "agent_team_name": "Everyone",
                  "agent_team_name_in_hierarchy": "Everyone",
                  "agent_link": null,
                  "customer_phone": "+420606078007",
                  "customer_name": "+420606078007",
                  "customer_link": null,
                  "segment_recording_offset": null,
                  "media": null,
                  "assessment_type": [
                      null
                  ],
                  "assessment_percentage": [
                      null
                  ],
                  "url": "https://flex-api.twilio.com/v1/Insights/Segments/02dd8a65-c9e3-550b-9e98-5b11abb9b3a5"
              }
          ],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://flex-api.twilio.com/v1/Insights/Segments?ReservationId=WReeeff42d5326cfdaa0f7a1181d00f1b1&PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://flex-api.twilio.com/v1/Insights/Segments?ReservationId=WReeeff42d5326cfdaa0f7a1181d00f1b1&PageSize=50&Page=0",
              "next_page_url": null,
              "key": "segments"
          }
      }
      ]
    ))

    actual = @client.flex_api.v1.insights_segments.list()

    expect(actual).to_not eq(nil)
  end
end