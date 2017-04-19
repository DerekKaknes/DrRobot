class TestTypesController < ApplicationController
  before_action :set_test_type, only: [:show]
  def new
    @test_type = TestType.new
    @test_type.build_unit
  end

  def create
    t = TestType.new(test_type_params)
    if t.save
      redirect_to test_type_path(t)
    else
      render :new
    end
  end

  def index
  end

  def show
  end

  private

  def set_test_type
    @test_type = TestType.find(params[:id])
  end

  def test_type_params
    params.require(:test_type).permit(:name, :description, :reference_type,
                                      :reference_range_low,
                                      :reference_range_high,
                                      :unit_id,
                                      unit_attributes: [:name]
                                     )
  end
end
