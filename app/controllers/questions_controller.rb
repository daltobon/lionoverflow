class QuestionsController < ApplicationController
	before_action :authenticate_user!, :except => [:index, :show]

	def index
		@questions = Question.all
	end

	def show
		@question = Question.find(params[:id])
	end

	def new
		@question = Question.new
	end

	def create
		@question = Question.create(questions_params)
		@question.user = currente_user
		if @question.save
			flash[:success] = "Pregunta publicada exit"  	
			redirect_to question_path(@question)
		else
			flash[:danger] = "Debes llenar todos los datos"
			redirect_to new_question_path
		end
	end

	def edit
	end

	private 
	def question_params
		params.require(:question).permit(:title, :description, :id)
	end
end
