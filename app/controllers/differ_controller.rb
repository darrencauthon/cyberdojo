root = '../..'

require_relative root + '/app/lib/GitDiff'

class DifferController < ApplicationController

  def diff
    setup_parameters
    @was_traffic_light = @traffic_lights[@was_tag - 1]
    @now_traffic_light = @traffic_lights[@now_tag - 1]
    @diffs = git_diff_view(@avatar.tags[@was_tag].diff(@now_tag))
    @ids_and_section_counts = prune(@diffs)
    @current_filename_id = most_changed_file_id(@diffs, @current_filename)

	render :json => {
	  :wasTrafficLight => @was_traffic_light.to_json,
	  :nowTrafficLight => @now_traffic_light.to_json,
	  :diffs => @diffs,
	  :idsAndSectionCounts => @ids_and_section_counts,
	  :currentFilenameId => @current_filename_id
	}
  end

private

  include GitDiff

  def setup_parameters
    @kata = dojo.katas[id]
    @avatar = @kata.avatars[params[:avatar]]
    @traffic_lights = @avatar.lights
    @min_tag = 0
    @was_tag = params[:was_tag].to_i
    @now_tag = params[:now_tag].to_i
    @max_tag = @traffic_lights.length
    @current_filename = params[:current_filename]
  end

  def prune(array)
    # diff-view has been refactored so each diff-view has its own
    # pair of [line-number,content] divs. The filenames are handled
    # separately and only need :id and :section_count entries.
    array.map {|hash| { :id => hash[:id], :section_count => hash[:section_count] } }
  end

end
