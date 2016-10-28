class TasksView
	# Recuerda que la única responsabilidad de la vista es desplegar data al usuario

	def index(list_task)
    repeat = list_task.count
    num = 0 
    status_display = ""
    p "Lista de actividades"
    p "-"*60
    p "#   Actividad    Status" 
    p "-"*60
    until num == repeat
      list_task.each_with_index {|task, index|
        if task.done == true
          status_display = "x" 
        else 
          status_display = " " 
        end  
        printf "%-5s", index + 1   
        puts "[#{status_display}]         #{task.task_name}"
        num += 1 } 
    end
  end

  def create(task_created)
    p "-"*60
    p "Agregaste exitosamente #{task_created.task_name}" 
    p "-"*60
  end

  def delete(task_deleted)
    p "-"*60
    p "#{task_deleted} ha sido eleminada de tu lista de tareas" 
    p "-"*60
  end

  def update(task_completed)
    p "-"*60
    p "#{task_completed} ha sido marcada como terminada. ¡Buen trabajo!" 
    p "-"*60
  end

	def error
	end
end
