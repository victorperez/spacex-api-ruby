module SpacexApi
  class Client
    module CompanyInfo
      def company_info
        get("company")
      end
    end
  end
end
