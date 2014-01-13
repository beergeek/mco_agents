metadata :name        => "disk",
         :description => "disk usage service for MCollective",
         :author      => "Brett",
         :license     => "GPLv2",
         :version     => "1.1",
         :url         => "https://github.com/beergeek/mco_agents",
         :timeout     => 30

action "get_df", :description => "Retrieves disk usage" do
   output :out,
          :description => "Gather disk usage",
          :display_as  => "Disk Usage"
end
