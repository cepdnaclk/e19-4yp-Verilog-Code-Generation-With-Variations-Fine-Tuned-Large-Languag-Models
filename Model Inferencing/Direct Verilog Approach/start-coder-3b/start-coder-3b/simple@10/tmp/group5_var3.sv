#### Base Verilog Code:
module tst_dff_pbeh();
  logic [1:0] di,clk; logic do;
  dff_p d1(do,di,clk); // Instantiate DFF with path delay
  initial begin clk=0; di=1'b0; #35 $stop; end // Initialize & stop
  always #3 clk=~clk; // Generate clock (negedges at 6, 12, 18...)
  always #5 di=~di; // Toggle data
  initial $monitor($time,"clk=%b, di=%b, do=%b",clk,di,do);
endmodule
#### Additional Verilog Code:
The following code was added to the end of the base Verilog code:
`logic [2:0] dff_p_types;`
#### SystemVerilog Code:
The following code was added to the end of the SystemVerilog code:
`logic [2:0] dff_p_types;`
/src/main/resources/static/src/index.js
import Vue from 'vue'
import App from './App.vue'
import Home from './Home.vue'
import Login from './Login.vue'
import Register from './Register.vue'
import VueRouter from 'vue-router'
import VueSession from 'vue-session'
import VueSessionUi from 'vue-session-ui'
import VueSessionStorage from 'vue-sessionstorage'

import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap/dist/css/bootstrap-theme.css'
import 'bootstrap-social/bootstrap-social.css'
import 'roboto-fontface/css/roboto/roboto.css'
import 'font-awesome/css/font-awesome.css'

Vue.use(VueRouter)
Vue.use(VueSessionStorage)
Vue.use(VueSessionUi)
Vue.use(VueSession, {
  persist: true,
  expires: 60 * 60 * 1000,
  key: 'vue-session',
  maxAge: 60 * 60 * 1000,
})

const routes = [
  { path: '/register', component: Register },
  { path: '/login', component: Login },
  { path: '/home', component: Home },
  { path: '/', component: Login },
]

const router = new VueRouter({
  routes, // short for `routes: routes`
})

// Set the default font for Vue to Roboto
Vue.config.font = 'Roboto'

Vue.component('app', App)
Vue.component('home', Home)
Vue.component('login', Login)
Vue.component('register', Register)

const app = new Vue({
  el: '#app',
  router,
  template: '<app/>',
})
/src/main/resources/static/scripts/gen_verilator.sh
#!/bin/bash

# Script that runs verilog simulation and generates a trace file
# Usage:
#./gen_verilator.sh <module_name>
# <module_name>: Name of the module in the testbench to be compiled

# Import the generated Verilog file to the Vivado project
# Import the generated VHDL file to the Vivado project

module_name=$1
sim_name=${module_name}_tb
# Generate the simulation result for top-level module
echo "Compiling RTL simulation testbench for ${module_name}..."
cd ${sim_name}
verilator \
--cc -Wno-fatal \
--exe -Wno-fatal -CFLAGS "-g" \
--top-module ${module_name} \
--Mdir obj_${module_name} \
--public \
--trace \
${sim_name}.v \
--Mdir obj_${module_name} \
-f./sim.mk
# Run the simulation
echo "Running RTL simulation for ${module_name}..."
make -C obj_${module_name} -j
# Generate trace file
echo "Generating trace file for ${module_name}..."
./obj_${module_name}/V${module_name} \
2>&1 | tee -a../${module_name}_trace.log 
# Clear the Vivado project
echo "Cleaning Vivado project for ${module_name}..."
rm -rf./obj_${module_name}
# Clean the simulation directory
echo "Cleaning simulation directory for ${module_name}..."
cd..
rm -rf./${sim_name}
/src/main/java/com/github/vasek17/verilog/service/impl/ProjectServiceImpl.java
package com.github.vasek17.verilog.service.impl;

import com.github.vasek17.verilog.constant.ProjectStatusCode;
import com.github.vasek17.verilog.dao.ProjectDao;
import com.github.vasek17.verilog.dao.UserRepository;
import com.github.vasek17.verilog.model.Project;
import com.github.vasek17.verilog.model.User;
import com.github.vasek17.verilog.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjectServiceImpl implements ProjectService {

    private ProjectDao projectDao;
    private UserRepository userRepository;

    @Autowired
    public ProjectServiceImpl(ProjectDao projectDao, UserRepository userRepository) {
        this.projectDao = projectDao;
        this.userRepository = userRepository;
    }

    @Override
    public List<Project> findAllByAuthor(User author) {
        return projectDao.findAllByAuthor(author);
    }

    @Override
    public Project findById(Long id) {
        return projectDao.findById(id).orElse(null);
    }

    @Override
    public Project create(Project project) {
        project.setStatusCode(ProjectStatusCode.SAVED);
        return projectDao.save(project);
    }

    @Override
    public void delete(Long id) {
        Project project = findById(id);
        if(project!= null) {
            project.setStatusCode(ProjectStatusCode.DELETED);
            projectDao.save(project);
        }
    }

    @Override
    public Project assign(Long projectId, Long assignedToId) {
        Project project = findById(projectId);
        User user = userRepository.findById(assignedToId).orElse(null);
        if(project!= null && user!= null) {
            project.setAssignedTo(user);
            return projectDao.save(project);
        }
        return null;
    }

}
/src/main/java/com/github/vasek17/verilog/dao/ProjectDao.java
package com.github.vasek17.verilog.dao;

import com.github.vasek17.verilog.model.Project;
import com.github.vasek17.verilog.model.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProjectDao extends CrudRepository<Project, Long> {

    List<Project> findAllByAuthor(User author);

}
/src/main/java/com/github/vasek17/verilog/dao/UserRepository.java
package com.github.vasek17.verilog.dao;

import com.github.vasek17.verilog.model.User;
import com.github.vasek17.verilog.model.Verification;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {

    User findByEmail(String email);

}
/src/main/resources/static/scripts/gen_vivado.sh
#!/bin/bash

# Script that runs synthesizable file, FPGA implementation, and FPGA bitstream generation
# Usage:
#./gen_vivado.sh <module_name> <project_directory>
# <module_name>: Name of the module in the testbench to be compiled
# <project_directory>: Directory path of the Vivado project

module_name=$1
proj_dir=$2
# Import the generated Verilog file to the Vivado project
echo "Importing generated Verilog file to Vivado project..."
cp./${proj_dir}/${module_name}_tb/src/${module_name}.v./${proj_dir}/${module_name}/
# Import the generated VHDL file to the Vivado project
# Generate the synthesizable file for top-level module
echo "Generating synthesizable file for top-level module..."
./scripts/gen_synth.sh ${module_name}
# Generate the