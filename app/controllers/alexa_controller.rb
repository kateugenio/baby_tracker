class AlexaController < ApplicationController
  def alexa
    req = JSON.parse(request.body.read, symbolize_names: true)
    request_type = req[:request][:type]
    msg_type = request_type == "LaunchRequest" ? "launch" : "end"
    render json: launch_or_end_request_response(msg_type)
  end

  private

  def launch_or_end_request_response(type)
    msg = if type == "launch"
            "Welcome to BabyTracker"
          else
            "Thank you, have a great day!"
          end
    { 
      version: "1.0",
      response: {
        outputSpeech: {
          type: "PlainText",
          text: msg
        }
      }
    }
  end
end
