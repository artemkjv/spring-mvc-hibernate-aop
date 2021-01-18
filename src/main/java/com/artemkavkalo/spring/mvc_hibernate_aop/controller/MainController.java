package com.artemkavkalo.spring.mvc_hibernate_aop.controller;

import com.artemkavkalo.spring.mvc_hibernate_aop.entity.Employee;
import com.artemkavkalo.spring.mvc_hibernate_aop.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;

import java.util.List;

@Controller
public class MainController {

    private final EmployeeService employeeService;

    @Autowired
    public MainController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @GetMapping("/")
    public String index(Model model){
        List<Employee> employees = employeeService.getAllEmployees();
        model.addAttribute("employees", employees);
        return "index";
    }

    @GetMapping("/create/employee")
    public String createEmployee(Model model){
        Employee employee = new Employee();
        model.addAttribute("employee", employee);
        return "create";
    }

    @GetMapping("/edit/employee/{id}")
    public String editEmployee(@PathVariable int id, Model model){
        Employee employee = employeeService.getEmployee(id);
        model.addAttribute("employee", employee);
        return "create";
    }

    @PostMapping("/edit/employee/{id}")
    public RedirectView updateEmployee(@PathVariable int id, @ModelAttribute("employee") Employee employee){
        employee.setId(id);
        employeeService.updateEmployee(employee);
        return new RedirectView("/");
    }

    @PostMapping("/create/employee")
    public RedirectView storeEmployee(@ModelAttribute("employee") Employee employee){
        employeeService.saveEmployee(employee);
        return new RedirectView("/");
    }

    @PostMapping("/delete/employee")
    public RedirectView deleteEmployee(@RequestParam("id") int id){
        employeeService.deleteEmployee(id);
        return new RedirectView("/");
    }

}
