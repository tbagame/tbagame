#encoding:utf-8
module Manage
  module UserTeamRelsHelper
    def part_list
      [
          ['队长', UserTeamRel::CAPTAIN],
          ['副队长', UserTeamRel::VICE_CAPTAIN],
          ['领队', UserTeamRel::LEADER],
          ['教练', UserTeamRel::COACH],
          ['联系人', UserTeamRel::LINKMAN],
          ['其他人员', UserTeamRel::ELSE],
      ]
    end

    def part_text(part)
      case part
        when UserTeamRel::CAPTAIN
          '队长'
        when UserTeamRel::VICE_CAPTAIN
          '副队长'
        when UserTeamRel::LEADER
          '领队'
        when UserTeamRel::COACH
          '教练'
        when UserTeamRel::LINKMAN
          '联系人'
        when UserTeamRel::ELSE
          '其他人员'
      end
    end
  end
end
