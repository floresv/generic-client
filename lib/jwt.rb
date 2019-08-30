JWT.module_eval do

  module_function

  def decode(jwt, key = nil, verify = true, options = {})
    return [{
      'data' => {
        'relationships' => {
          'renderings' => {
            'data' => [
              'id' => 'fake_id'
            ]
          }
        }
      }
    }]
  end
end
