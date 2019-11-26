package com.kh.finalProject.student.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.finalProject.student.model.service.StudentService;


@Controller
public class StudentController {

	@Autowired
	private StudentService service;
}
