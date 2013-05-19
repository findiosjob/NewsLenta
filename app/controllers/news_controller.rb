#coding:utf-8
class NewsController < ApplicationController
  # GET /news
  # GET /news.json
  def index

    @news = get_news params

    @user = user_from_session

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @news }
    end
  end

  # GET /news/1
  # GET /news/1.json
  def show
    @news = News.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @news }
    end
  end

  # GET /news/new
  # GET /news/new.json
  def new
    @news = News.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @news }
    end
  end

  # GET /news/1/edit
  def edit
    @news = News.find(params[:id])
  end

  # POST /news
  # POST /news.json
  def create
    @news = News.new(params[:news])

    respond_to do |format|
      if @news.save
        format.html { redirect_to @news, notice: 'News was successfully created.' }
        format.json { render json: @news, status: :created, location: @news }
      else
        format.html { render action: "new" }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /news/1
  # PUT /news/1.json
  def update
    @news = News.find(params[:id])

    respond_to do |format|
      if @news.update_attributes(params[:news])
        format.html { redirect_to @news, notice: 'News was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @news = News.find(params[:id])
    @news.destroy

    respond_to do |format|
      format.html { redirect_to news_index_url }
      format.json { head :no_content }
    end
  end

  private
  def user_from_session 
    if session[:user_id].nil?
      nil
    else
      User.find_by_id session[:user_id]
    end
  end

  def get_news p
    if p[:category_id].nil?
      choice_news News.all
    else
      choice_news News.where(:categories_id => p[:category_id])
    end
  end

  def choice_news news
    if news.count <= 3
      news
    else
      list_to_show = get_list_to_show news.count
      select_news news, list_to_show
    end
  end

  def get_list_to_show count
    count_to_show = 3
    is_generate = false
    list_to_show = []

    while not is_generate do
      list_to_show = count_to_show.times.map {rand count}
      if list_to_show.uniq{|x| x}.count == count_to_show
        is_generate = true
      end
    end
    list_to_show

  end

  def select_news news, list_to_show
    rslt = []
    list_to_show.each do |num|
      rslt << news[num]
    end
    rslt
  end

end
