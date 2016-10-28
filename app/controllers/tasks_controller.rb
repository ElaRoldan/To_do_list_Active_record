class TasksController
  def initialize(args)
    @view = TasksView.new  #variable para mandar todo al archivo Tasks View de la aplicacion
    menu(args)  #Aqui recibimos la informacion del usuario por el ARGV
  end
  
  #Metodo que llama a los metodos en funcion de la solicitud del usuario
  def menu(args) 
    option = args[0] #Aqui se gurda el primer comando 
    task = args[1..-1].join(" ") #Aqui guarda la tarea y el join es para volverlo string
    case option
      when "index" then index(task) #Cada comando llama a su metodo correspondiente
      when "add" then add(task) 
      when "delete" then delete(task)  
      when "complete" then complete(task)
    end   
  end   

  #Metodo para mostrar todas las tareas
  def index(task)
    list_tasks = Task.all #Utiliza el metodo de Active record para llamar a todas las tareas de la base de datos
    @view.index(list_tasks) #Mandas el listado con todas las tareas al archivo view
  end

  #Metodo para agregar tareas
  def add(task)  
    Task.create(task_name: task, done: false) #Comando de active record para crear un nuevo registro en la base de datos
    task_created = Task.all.last 
    @view.create(task_created)
  end

  #Metodo para borrar tareas en la base de datos
  def delete(num)
    list_tasks = Task.all 
    task_to_delete = ""
    list_tasks.each_with_index {|task, index| 
      if index + 1 == num.to_i
        task_to_delete = Task.find_by(task_name: task.task_name).destroy #Metodo de Active Record para buscar find_by de una variable y destroy para borrar en la base de datos  
      end }  
    @view.delete(task_to_delete.task_name) #Mandas el nombre de la tarea a la vista 
    
  end
  
  #Metodo que cambia el atributo done a true, para una tarea que ya fue realizada 
  def complete(num)
    list_tasks = Task.all 
    task_to_complete = ""
    list_tasks.each_with_index {|task, index| 
      if index + 1 == num.to_i
        task_to_complete = Task.find_by(task_name: task.task_name)
        task_to_complete.update_attributes({:done => true}) #Metodo de Active record para modificar atributos
      end }
      @view.update(task_to_complete.task_name)
  end
end
