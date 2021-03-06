<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <!--section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Mahasiswa</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Menu Management</li>
            </ol>
          </div>
        </div>
      </div>
    </section-->

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-12" style="margin-top:2px ">
          <div class="card">
            <div class="card-header">
              <!--h3 class="card-title">DataTable with minimal features & hover style</h3-->
              <h3 class='box-title'>Mahasiswa LIST <?php echo anchor('mhs/create/','Create',array('class'=>'btn btn-danger btn-sm'));?>
                <?php echo anchor(site_url('mhs/excel'), ' <i class="fa fa-file-excel"></i> Excel', 'class="btn btn-primary btn-sm"'); ?>
                <?php echo anchor(site_url('mhs/word'), '<i class="fa fa-file-word"></i> Word', 'class="btn btn-primary btn-sm"'); ?>
                <?php echo anchor(site_url('mhs/pdf'), '<i class="fa fa-file-pdf"></i> PDF', 'class="btn btn-primary btn-sm"'); ?>
      
              </h3>
            <!-- /.card-header id="example1" -->
            <form action="<?php echo site_url('mhs/index') ?>" method="POST">
            <div class="card-body">
              <!--div class="row d-flex justify-content-start">
                <div class="col-lg-2">
                <span>
                <label>Filter</label> &nbsp;&nbsp;&nbsp; <input type="checkbox" name="jurusan" value="jurusan"> Jurusan
                </span>
                </div>
              </div-->
              <div class="input-group d-flex justify-content-end" style="padding-bottom: 2px">
                  <label>Jumlah Data :<?php echo $jlh_data." &nbsp;&nbsp;";?></label>
                  <input type="text" class="form-control col-lg-2" placeholder="Nim/Nama" name="cari" value="<?php echo $this->session->flashdata('pag')?>">
                  <input type="submit" class="form-control col-lg-1" name="s_cari" value="Cari">                  
                  <input type="submit" class="form-control col-lg-1" name="reset" value="Reset">
              </div>
            </form>
              <table class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th width="10px">No</th>
                  <th>NIM</th>
                  <th>Nama</th>
                  <th>Jenis Kelamin</th>
                  <th>Status</th>
                  <th>Aksi</th>
                </tr>
                </thead>
                <tbody>
                <?php
                $start = $this->uri->segment(3);
                foreach ($mhs_data->result() as $mhs)
                {
                //$active = $menu->is_active==1?'AKTIF':'TIDAK AKTIF';
                //$parent = $menu->is_parent>1?'MAINMENU':'SUBMENU'
                  $gender = $mhs->gender=='L'?'Laki-Laki':'Perempuan'
                ?>
                <tr>
                  <td><?php echo ++$start ?></td>
                  <td><?php echo $mhs->nim ?></td>
                  <td><?php echo $mhs->nama ?></td>
                  <td><?php echo $gender?></td>
                  <td><?php echo "Aktif" ?></td>
                  <td style="text-align:center" width="140px">
                    <?php 
                    echo anchor(site_url('mhs/read/'.$mhs->nim),'<i class="fa fa-eye"></i>',array('title'=>'detail','class'=>'btn btn-primary btn-sm')); 
                    echo '  '; 
                    echo anchor(site_url('mhs/update/'.$mhs->nim),'<i class="fa fa-edit"></i>',array('title'=>'edit','class'=>'btn btn-warning btn-sm')); 
                    echo '  '; 
                    echo anchor(site_url('mhs/delete/'.$mhs->nim),'<i class="fa fa-trash"></i>','title="delete" class="btn btn-danger btn-sm" onclick="javasciprt: return confirm(\'Are You Sure ?\')"'); 
                    ?>
                  </td>
                </tr>
                <?php
                }
                ?>
                </tbody>
              </table>
              <div class="row">
                <div class="col">
                    <!--Tampilkan pagination-->
                    <?php echo $pagination; ?>
                </div>
              </div>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
          <!-- /.card -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>