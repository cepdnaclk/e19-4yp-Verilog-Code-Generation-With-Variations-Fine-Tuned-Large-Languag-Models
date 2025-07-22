module tst_CMOSsw1();
  reg in,con; wire out;
  CMOSsw1 cmsw(out,in,con); // Instantiate CMOS switch
  initial begin in=1'b0; con=1'b1; end // Start enabled
  always #5 in =~in; // Toggle data
  always #3 con=~con; // Toggle control
  /*
  if(cmsw[0:1]=='00') begin 
    $display("cmsw[0:1] = 00");
  end
  else $display("cmsw[0:1] is not 00!");
  if(cmsw[0:1]=='01') begin 
    $display("cmsw[0:1] = 01");
  end
  else $display("cmsw[0:1] is not 01!");
  */
  initial $monitor($time, "in = %b, con = %b, output = %b ",in,con,out);
  initial #20 $stop; // Stop simulation
endmodule
*Output*
```
CMOSsw1.sv:13:1: syntax error, unexpected '00'
 if(cmsw[0:1]=='00') begin 
```
/src/components/CourseDetails/CourseDetails.jsx
import React from "react";

const CourseDetails = ({ course }) => (
  <div>
    <b>Course Name :</b> {course.name} <br />
    <b>Course Number :</b> {course.number} <br />
    <b>Instructor :</b> {course.instructor} <br />
    <b>Credits :</b> {course.credits} <br />
    <b>Location :</b> {course.room} <br />
    <b>Start Time :</b> {course.start_time} <br />
    <b>End Time :</b> {course.end_time} <br />
  </div>
);

export default CourseDetails;
/src/components/CourseList/CourseList.jsx
import React from "react";
import Course from "../Course/Course";
import "./CourseList.css";

const CourseList = ({ courses, onCourseSelect }) => {
  return (
    <ul className="courselist">
      {courses.map(course => (
        <Course
          key={course.number}
          course={course}
          onCourseSelect={() => onCourseSelect(course)}
        />
      ))}
    </ul>
  );
};

export default CourseList;
/src/components/SearchBar/SearchBar.jsx
import React from "react";
import "./SearchBar.css";

class SearchBar extends React.Component {
  state = {
    value: ""
  };

  constructor(props) {
    super(props);
    this.input = React.createRef();
  }

  onChange = e => {
    this.setState({ value: e.target.value });
    this.props.onSearchBarInput(e.target.value);
  };

  render() {
    return (
      <div className="search-component">
        <label htmlFor="search">Search</label>
        <input
          name="search"
          className="search-field"
          placeholder="Search..."
          value={this.state.value}
          onChange={this.onChange}
        />
      </div>
    );
  }
}
export default SearchBar;
/src/components/Course/Course.jsx
import React from "react";
import "./Course.css";

const Course = ({ course, onCourseSelect }) => {
  return (
    <li className="course" onClick={onCourseSelect}>
      <div className="course-name">{course.name}</div>
      <div className="course-number">{course.number}</div>
      <div className="course-instructor">{course.instructor}</div>
      <div className="course-credits">{course.credits}</div>
      <div className="course-location">{course.room}</div>
      <div className="course-start">{course.start_time}</div>
      <div className="course-end">{course.end_time}</div>
    </li>
  );
};

export default Course;
/src/components/Course/Course.test.js
import React from "react";
import { cleanup, fireEvent, render, screen } from "@testing-library/react";
import Course from "./Course";

describe("Course", () => {
  afterEach(cleanup);

  let course = {
    name: "",
    number: "CSE 101",
    instructor: "Dr. ",
    credits: 3,
    room: "SELAB",
    start_time: "19:00",
    end_time: "19:30"
  };
  test("should render Course component", () => {
    render(<Course course={course} />);
    const courseName = screen.getByText("My First Course");
    const courseNumber = screen.getByText("CSE 101");
    const courseInstructor = screen.getByText("Dr. ");
    const courseCredits = screen.getByText("3");
    const courseRoom = screen.getByText("SELAB");
    const courseStartTime = screen.getByText("19:00");
    const courseEndTime = screen.getByText("19:30");
    expect(courseName).toBeInTheDocument();
    expect(courseNumber).toBeInTheDocument();
    expect(courseInstructor).toBeInTheDocument();
    expect(courseCredits).toBeInTheDocument();
    expect(courseRoom).toBeInTheDocument();
    expect(courseStartTime).toBeInTheDocument();
    expect(courseEndTime).toBeInTheDocument();
  });

  test("should update classList when onCourseSelect is called", () => {
    const onCourseSelect = jest.fn();
    render(<Course course={course} onCourseSelect={onCourseSelect} />);
    const courseName = screen.getByText("My First Course");
    fireEvent.click(courseName);
    expect(onCourseSelect).toHaveBeenCalledTimes(1);
    expect(onCourseSelect).toHaveBeenCalledWith(course);
  });
});
/src/components/CourseDetails/CourseDetails.test.js
import React from "react";
import { cleanup, render } from "@testing-library/react";
import CourseDetails from "./CourseDetails";

describe("CourseDetails", () => {
  afterEach(cleanup);

  test("should render CourseDetails", () => {
    const course = {
      name: "",
      number: "CSE 101",
      instructor: "Dr. ",
      credits: 3,
      room: "SELAB",
      start_time: "19:00",
      end_time: "19:30"
    };
    render(<CourseDetails course={course} />);
  });
});
/src/components/CourseList/CourseList.test.js
import React from "react";
import { cleanup, fireEvent, render, screen } from "@testing-library/react";
import CourseList from "./CourseList";

let course = {
  name: "",
  number: "CSE 101",
  instructor: "Dr. ",
  credits: 3,
  room: "SELAB",
  start_time: "19:00",
  end_time: "19:30"
};
let courses = [
  {
    name: "My First Course",
    number: "CSE 101",
    instructor: "Dr. ",
    credits: 3,
    room: "SELAB",
    start_time: "19:00",
    end_time: "19:30"
  },
  {
    name: "My Another Course",
    number: "CSE 102",
    instructor: "Dr. ",
    credits: 3,
    room: "SELAB",
    start_time: "19:00",
    end_time: "19:30"
  }
];

describe("CourseList", () => {
  afterEach(cleanup);

  test("should render CourseList", () => {
    const onCourseSelect = jest.fn();
    render(<CourseList courses={courses} onCourseSelect={onCourseSelect} />);
    const course = screen.getByText("My First Course");
    expect(course).toBeInTheDocument();
  });

  test("should call onCourseSelect", () => {
    const onCourseSelect = jest.fn();
    render(<CourseList courses={courses} onCourseSelect={onCourseSelect} />);
    const course = screen.getByText("My First Course");
    fireEvent.click(course);
    expect(onCourseSelect).toHaveBeenCalledTimes(1);
    expect(onCourseSelect).toHaveBeenCalledWith(courses[0]);
  });
});
/src/__tests__/reducer/selectCourse.test.js
import selectCourse from "../../reducer/selectCourse";
import course from "../fixtures/course";

test("should set selected course", () => {
  const selectedCourse = selectCourse({}, { type: "SET_COURSE", course });

  expect(selectedCourse).toEqual(course);
});

test("should remove selected course", () => {
  const selectedCourse =