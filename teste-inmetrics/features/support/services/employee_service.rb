class ApiEmployee
    include HTTParty

    base_uri CONFIG['url_api']
    headers  "Content-Type" => "application/json"

    def self.create(employee, authorization)
        post("/empregado/cadastrar", headers: { "Authorization" => authorization }, body: employee.to_json)
    end

    def self.list_all(authorization)
        get("/empregado/list_all", headers: { "Authorization" => authorization })
    end

    def self.list(employee_id, authorization)
        get("/empregado/list/#{employee_id}", headers: { "Authorization" => authorization })
    end

    def self.update(employee_id, employee, authorization)
        put("/empregado/alterar/#{employee_id}", headers: { "Authorization" => authorization }, body: employee.to_json)
    end
end