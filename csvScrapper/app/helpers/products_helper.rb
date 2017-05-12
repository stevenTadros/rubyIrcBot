module ProductsHelper
	def sort_link(column, title = nil)
		title ||= column.titleize
		direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
		icon = sort_direction == "asc" ? "up" : "down"
		icon = column == sort_column ? icon : ""
		search = params[:search]
		link_to "#{title} <span class='#{icon}'></span>".html_safe, {search: search, commit: "Search", column: column, direction: direction}
	end
end