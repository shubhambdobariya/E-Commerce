module ProjectsHelper
    def developer_dropdown_options
        Developer.all.map { |developer| [developer.name, developer.id] }
      end
end
