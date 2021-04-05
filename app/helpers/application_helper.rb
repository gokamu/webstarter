module ApplicationHelper
    def check_signed_user
        if student_signed_in? && current_student.school.id != @school.id
            redirect_to current_student.school      
        elsif teacher_signed_in? && current_teacher.school.id != @school.id
        redirect_to current_teacher.school 
        elsif admin_signed_in? && current_admin.school.id != @school.id
        redirect_to current_admin.school 
        end
    end
end
