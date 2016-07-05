require 'spec_helper'
require 'jsend-rails/controller'
require 'active_support/all'

describe JSend::Rails::Controller do
  class C
    include JSend::Rails::Controller
  end

  describe "#render_jsend" do
    let (:c) { C.new }
    let (:envelope) { {status: :success, result: {}} }

    before do
      allow(c).to receive(:render)
      allow(JSend::Rails::Envelope).to receive(:compute).and_return(envelope)
    end

    it "should render json by default" do
      c.render_jsend({success: {}})

      expect(c).to have_received(:render).with(json: envelope.to_json)
    end

    it "should render text if requested" do
      c.render_jsend({success: {}, render: {as: :text, layout: true}})

      expect(c).to have_received(:render).with(text: envelope.to_json, layout: true)
    end
  end
end
