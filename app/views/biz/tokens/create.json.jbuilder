if @token.persisted?
  json.token render(partial: 'biz/tokens/token', formats: :html, locals: { token: @token })
  json.form render(partial: 'biz/tokens/form', formats: :html,
                   locals: { token: Token.new, business: @business, collection: @collection })
  json.counter @collection.tokens.count
else
  json.form render(partial: 'biz/tokens/form', formats: :html,
                   locals: { token: @token, business: @business, collection: @collection })
end
