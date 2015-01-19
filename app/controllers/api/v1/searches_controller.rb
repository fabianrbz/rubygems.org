class Api::V1::SearchesController < Api::BaseController

  skip_before_filter :verify_authenticity_token
  respond_to :json, :yaml

  def show
    @rubygems = Rubygem.search(params.require(:query)).with_versions.paginate(:page => params[:page])
    respond_with(@rubygems, :yamlish => true)
  end
end
