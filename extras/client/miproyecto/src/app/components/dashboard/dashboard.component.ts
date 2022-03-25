import { Component, OnInit } from '@angular/core';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {

  constructor(private service: UserService) { }

  ngOnInit(): void {
  }


  getdata(){
    //retorne la informacion
    this.service.getdata().subscribe(
      (res:any)=>{
        console.log(res);
        alert(res.incremental)
      },
      (err)=> {
        console.log(err);

      }
    )
  }


  setdata(){

    var json ={
      dato:30
    }

    this.service.setdata(json).subscribe(
      (res)=> {
        alert("todo fue realizado con exito")


        //insertar lo que devuelva el serviodr en un text areas, h1, p
      }, (err)=> {
        console.log(err);

      }
    )
  }

}
