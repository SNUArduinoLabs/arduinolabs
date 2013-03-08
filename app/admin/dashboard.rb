ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1

  content title: "Dashboard" do

    columns do 
      column do
        panel "Current Stats" do
          div do
            render('/admin/site_stats')
          end
        end
      end
      column do
      end
      column do
        panel "About Us" do
          "We are Hackers + Makers"
        end
      end
    end
  end

    #  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }


    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
end
