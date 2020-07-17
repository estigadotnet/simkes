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
              <li class="breadcrumb-item active">Mahasiswa</li>
            </ol>
          </div>
        </div>
      </div>
    </section-->
        <!-- Main content -->
        <section class='content'>
          <div class='row d-flex justify-content-center'>
            <div class='col-lg-8' style="margin-top: 2px;">
              <div class='card'>
                <div class='card-header'>
                  <h4 class='d-flex justify-content-center'><?php echo $judul; ?></h4>
                  <table class="table table-bordered">
                    <tr><td>NIS</td><td><?php echo $nis; ?></td></tr>
              	    <tr><td>Nama Siswa</td><td><?php echo $namasiswa; ?></td></tr>
              	    <tr><td>Kelas</td><td><?php echo $kelas; ?></td></tr>
                    <tr><td>Tahun Ajaran</td><td><?php echo $tahunajaran; ?></td></tr>
                    <tr><td>SPP</td><td><?php echo $byrspp; ?></td></tr>
                    <tr><td>Catering</td><td><?php echo $byrcatering; ?></td></tr>
                    <tr><td>Worksheet</td><td><?php echo $byrworksheet; ?></td></tr>
              	    <tr><td></td><td><a href="<?php echo site_url('siswa') ?>" class="btn btn-default">Cancel</a></td>
                    </tr>
          	       </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
</div>
