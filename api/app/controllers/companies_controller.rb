class CompaniesController < ApplicationController
  def index
    companies = Company.all
    render json: { status: 'SUCCESS', message: 'Loaded posts', data: companies }
  end

  def show
    company = Company.find(params[:id])
    render json: { status: 'SUCCESS', message: 'Loaded posts', data: company }
  end
end
