
require 'json'

LD = {
  clients:  -> { JSON.parse(`hyprctl clients -j`)         },
  desc:     -> (row) { row.split(/:\s/)[1..-1].join(' ')  },
  mon_name: -> (row) { row.gsub(/\:/, '').split(/\s/)[-1] },
  sid:      -> (row) { LD[:second].call(row).to_i         },
  second:   -> (row) { row.split(/\s/)[1]                 },
  window_a: -> { JSON.parse(`hyprctl activewindow -j`)    },
  status:   -> (wsid){ 
    wsid.to_i == LD[:window_a].()['workspace']['id'] && (return :active)
    LD[:clients].().map{|c| c['workspace']['id']}.uniq.include?(wsid.to_i) && (return :open)
    return :none
  },
  wsid:     -> (row) { row.split(/\s/)[2].to_i            }
}

LN = { is_zero: ->(val) { vs = val.to_s ; ( vs == '0' || vs == '0.0' ) } }
LP = { value: ->(prop) { prop.split(/\:\s/)[-1] } }
LW = { break_out: ->{ `hyprctl clients`.split(/\n/).reject!{|r| r.empty?}.map{|r| r.gsub(/\t/, ' - ')}.each_slice(22).to_a } }

LW[:active_ws] = ->{ LW[:break_out].call.map{|ws| LP[:value].(ws[5]).to_i}.uniq.sort }
LW[:focus_w]   = ->{ LW[:break_out].call.each_with_index.select{|r, rdx| LN[:is_zero].(LP[:value].(r[-1]))}.flatten }
