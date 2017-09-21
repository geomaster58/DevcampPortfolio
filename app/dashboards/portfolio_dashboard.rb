require "administrate/base_dashboard"

class PortfolioDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    technologies: Field::HasMany,
    id: Field::Number,
    title: Field::String,
    subtitle: Field::String,
    body: Field::Text,
    main_image: Field::Text,
    thumb_image: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    position: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :technologies,
    :id,
    :title,
    :subtitle,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :technologies,
    :id,
    :title,
    :subtitle,
    :body,
    :main_image,
    :thumb_image,
    :created_at,
    :updated_at,
    :position,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :technologies,
    :title,
    :subtitle,
    :body,
    :main_image,
    :thumb_image,
    :position,
  ].freeze

  # Overwrite this method to customize how portfolios are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(portfolio)
  #   "Portfolio ##{portfolio.id}"
  # end
end
