module MCollective
  module Agent
    class Disk < RPC::Agent
      action 'get_df' do
        reply[:statuscode] = run("df -h --exclude-type=nfs --exclude-type=nfsv4 --exclude-type=tmpfs | awk '{if(NR>1)print}'", :stdout => :out, :stderr => :err, :chomp => true)
      end
    end
  end
end
