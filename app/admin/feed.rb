ActiveAdmin.register Feed do
  
  controller do
      def permitted_params
        params.permit(:feed => [:name, :url])
      end
    end
end
