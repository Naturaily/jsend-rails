require 'rspec/core'
require 'rspec/matchers'

module JSend
  module Rails
    module Test
      module Matchers
        RSpec::Matchers.define :be_json do
          match do |response|
            response.content_type.to_s =~ /^application\/json/
          end
          failure_message do |response|
            "Response should have application/json content type"
          end
          failure_message_when_negated do |response|
            "Response should not have application/json content type"
          end
          alias negative_failure_message failure_message_when_negated
        end

        RSpec::Matchers.define :be_jsend_success do
          match do |response|
            response.json['status'] == 'success'
          end
          failure_message do |response|
            "Response should be JSend success"
          end
          failure_message_when_negated do |response|
            "Response should not be JSend success"
          end
          alias negative_failure_message failure_message_when_negated
        end

        RSpec::Matchers.define :be_jsend_failure do
          match do |response|
            response.json['status'] == 'fail'
          end
          failure_message do |response|
            "Response should be JSend failure"
          end
          failure_message_when_negated do |response|
            "Response should not be JSend failure"
          end
          alias negative_failure_message failure_message_when_negated
        end

        RSpec::Matchers.define :be_jsend_error do
          match do |response|
            response.json['status'] == 'error'
          end
          failure_message do |response|
            "Response should be JSend error"
          end
          failure_message_when_negated do |response|
            "Response should not be JSend error"
          end
          alias negative_failure_message failure_message_when_negated
        end
      end
    end
  end
end
