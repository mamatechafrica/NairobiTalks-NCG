require 'openai'
class OpenAiService
  def initialize
    @client = OpenAI::Client.new(access_token: ENV["OPENAI_API_KEY"])
  end

  def summarize_pdf(file)
    content = PDF::Reader.new(file.download).pages.map(&:text).join(" ").truncate(3000)
    response = @client.chat(parameters: {
      model: "gpt-4",
      messages: [
        { role: "system", content: "You are an assistant summarizing government planning documents." },
        { role: "user", content: "Summarize this: #{content}" }
      ]
    })
    response.dig("choices", 0, "message", "content")
  end
end