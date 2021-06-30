##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Room' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.video.v1.rooms('RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://video.twilio.com/v1/Rooms/RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "status": "in-progress",
          "type": "peer-to-peer",
          "sid": "RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "enable_turn": true,
          "unique_name": "unique_name",
          "max_participants": 10,
          "max_concurrent_published_tracks": 0,
          "duration": 0,
          "status_callback_method": "POST",
          "status_callback": null,
          "record_participants_on_connect": false,
          "video_codecs": [
              "VP8"
          ],
          "media_region": "us1",
          "end_time": "2015-07-30T20:00:00Z",
          "url": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "participants": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants",
              "recordings": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Recordings",
              "recording_rules": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/RecordingRules"
          }
      }
      ]
    ))

    actual = @client.video.v1.rooms('RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.video.v1.rooms.create()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://video.twilio.com/v1/Rooms',
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "status": "in-progress",
          "type": "peer-to-peer",
          "sid": "RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "enable_turn": true,
          "unique_name": "RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "max_concurrent_published_tracks": 0,
          "max_participants": 10,
          "duration": 0,
          "status_callback_method": "POST",
          "status_callback": null,
          "record_participants_on_connect": false,
          "video_codecs": [
              "VP8"
          ],
          "media_region": "us1",
          "end_time": "2015-07-30T20:00:00Z",
          "url": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "participants": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants",
              "recordings": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Recordings",
              "recording_rules": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/RecordingRules"
          }
      }
      ]
    ))

    actual = @client.video.v1.rooms.create()

    expect(actual).to_not eq(nil)
  end

  it "receives create_webrtc_go responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "status": "in-progress",
          "type": "go",
          "sid": "RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "enable_turn": true,
          "unique_name": "room1",
          "max_participants": 10,
          "max_concurrent_published_tracks": 0,
          "duration": 0,
          "status_callback_method": "POST",
          "status_callback": null,
          "record_participants_on_connect": false,
          "video_codecs": [
              "VP8"
          ],
          "media_region": "us1",
          "end_time": "2015-07-30T20:00:00Z",
          "url": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "participants": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants",
              "recordings": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Recordings",
              "recording_rules": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/RecordingRules"
          }
      }
      ]
    ))

    actual = @client.video.v1.rooms.create()

    expect(actual).to_not eq(nil)
  end

  it "receives create_group_rooms responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "status": "in-progress",
          "type": "group",
          "sid": "RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "enable_turn": true,
          "unique_name": "grouproom",
          "max_participants": 50,
          "max_concurrent_published_tracks": 170,
          "duration": 0,
          "status_callback_method": "POST",
          "status_callback": null,
          "record_participants_on_connect": false,
          "video_codecs": [
              "VP8"
          ],
          "media_region": "us1",
          "end_time": "2015-07-30T20:00:00Z",
          "url": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "participants": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants",
              "recordings": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Recordings",
              "recording_rules": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/RecordingRules"
          }
      }
      ]
    ))

    actual = @client.video.v1.rooms.create()

    expect(actual).to_not eq(nil)
  end

  it "receives create_small_group_rooms responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "status": "in-progress",
          "type": "group-small",
          "sid": "RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "enable_turn": true,
          "unique_name": "SmallDailyStandup",
          "max_participants": 4,
          "max_concurrent_published_tracks": 170,
          "duration": 0,
          "status_callback_method": "POST",
          "status_callback": null,
          "record_participants_on_connect": false,
          "video_codecs": [
              "VP8"
          ],
          "media_region": "us1",
          "end_time": "2015-07-30T20:00:00Z",
          "url": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "participants": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants",
              "recordings": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Recordings",
              "recording_rules": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/RecordingRules"
          }
      }
      ]
    ))

    actual = @client.video.v1.rooms.create()

    expect(actual).to_not eq(nil)
  end

  it "receives create_large_group_rooms responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "status": "in-progress",
          "type": "group",
          "sid": "RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "enable_turn": true,
          "unique_name": "MyWebinar",
          "max_participants": 50,
          "max_concurrent_published_tracks": 16,
          "duration": 0,
          "status_callback_method": "POST",
          "status_callback": null,
          "record_participants_on_connect": false,
          "video_codecs": [
              "VP8"
          ],
          "media_region": "us1",
          "end_time": "2015-07-30T20:00:00Z",
          "url": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "participants": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants",
              "recordings": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Recordings",
              "recording_rules": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/RecordingRules"
          }
      }
      ]
    ))

    actual = @client.video.v1.rooms.create()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.video.v1.rooms.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://video.twilio.com/v1/Rooms',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "rooms": [],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://video.twilio.com/v1/Rooms?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://video.twilio.com/v1/Rooms?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "rooms"
          }
      }
      ]
    ))

    actual = @client.video.v1.rooms.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_with_status responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "rooms": [
              {
                  "sid": "RM4070b618362c1682b2385b1f9982833c",
                  "status": "completed",
                  "date_created": "2017-04-03T22:21:49Z",
                  "date_updated": "2017-04-03T22:21:51Z",
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "type": "peer-to-peer",
                  "enable_turn": true,
                  "unique_name": "RM4070b618362c1682b2385b1f9982833c",
                  "status_callback": null,
                  "status_callback_method": "POST",
                  "end_time": "2017-04-03T22:21:51Z",
                  "duration": 2,
                  "max_participants": 10,
                  "max_concurrent_published_tracks": 10,
                  "record_participants_on_connect": false,
                  "video_codecs": [
                      "VP8"
                  ],
                  "media_region": "us1",
                  "url": "https://video.twilio.com/v1/Rooms/RM4070b618362c1682b2385b1f9982833c",
                  "links": {
                      "participants": "https://video.twilio.com/v1/Rooms/RM4070b618362c1682b2385b1f9982833c/Participants",
                      "recordings": "https://video.twilio.com/v1/Rooms/RM4070b618362c1682b2385b1f9982833c/Recordings",
                      "recording_rules": "https://video.twilio.com/v1/Rooms/RM4070b618362c1682b2385b1f9982833c/RecordingRules"
                  }
              }
          ],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://video.twilio.com/v1/Rooms?Status=completed&PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://video.twilio.com/v1/Rooms?Status=completed&PageSize=50&Page=0",
              "next_page_url": null,
              "key": "rooms"
          }
      }
      ]
    ))

    actual = @client.video.v1.rooms.list()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.video.v1.rooms('RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update(status: 'in-progress')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'Status' => 'in-progress', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://video.twilio.com/v1/Rooms/RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
        data: values,
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "status": "completed",
          "type": "peer-to-peer",
          "sid": "RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "enable_turn": true,
          "unique_name": "unique_name",
          "max_participants": 10,
          "max_concurrent_published_tracks": 10,
          "status_callback_method": "POST",
          "status_callback": null,
          "record_participants_on_connect": false,
          "video_codecs": [
              "VP8"
          ],
          "media_region": "us1",
          "end_time": "2015-07-30T20:00:00Z",
          "duration": 10,
          "url": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "participants": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants",
              "recordings": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Recordings",
              "recording_rules": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/RecordingRules"
          }
      }
      ]
    ))

    actual = @client.video.v1.rooms('RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update(status: 'in-progress')

    expect(actual).to_not eq(nil)
  end
end