<div class="content-wrapper">
  <!-- Main content -->
  <section class="content">
    <div class="row">
      <div class="col-12" style="margin-top:8px ">
        <div class="card">

          <div class="card-header">
            <h4 class='box-title'>Tahun Ajaran <?php echo anchor('tahunajaran/create/','Tambah Data',array('class'=>'btn btn-danger btn-sm'));?></h4>
          </div>

          <div class="card-body">

            <form action="<?php echo site_url('tahunajaran/index') ?>" method="POST">
            <div class="input-group d-flex justify-content-end" style="padding-bottom: 2px">
              <label>Jumlah Data :<?php echo $jlh_data." &nbsp;&nbsp;";?></label>
              <input type="text" class="form-control col-lg-2" placeholder="Tahun Ajaran" name="cari" value="<?php echo $this->session->flashdata('pag')?>">
              <input type="submit" class="form-control col-lg-1" name="s_cari" value="Cari">
              <input type="submit" class="form-control col-lg-1" name="reset" value="Reset">
            </div>
            </form>

            <table class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th width="10px">No</th>
                  <th>Tahun Ajaran</th>
                  <th>Aksi</th>
                </tr>
              </thead>
              <tbody>
                <?php $start = $this->uri->segment(3); ?>
                <?php foreach ($tahunajaran_data->result() as $tahunajaran) { ?>
                <tr>
                  <td><?php echo ++$start ?></td>
                  <td><?php echo $tahunajaran->tahunajaran ?></td>
                  <td style="text-align:center" width="140px">
                    <?php
                    echo anchor(site_url('tahunajaran/read/'.$tahunajaran->idtahunajaran),'<i class="fa fa-eye"></i>',array('title'=>'detail','class'=>'btn btn-primary btn-sm'));
                    echo '  ';
                    echo anchor(site_url('tahunajaran/update/'.$tahunajaran->idtahunajaran),'<i class="fa fa-edit"></i>',array('title'=>'edit','class'=>'btn btn-warning btn-sm'));
                    echo '  ';
                    echo anchor(site_url('tahunajaran/delete/'.$tahunajaran->idtahunajaran),'<i class="fa fa-trash"></i>','title="delete" class="btn btn-danger btn-sm" onclick="javasciprt: return confirm(\'Are You Sure ?\')"');
                    ?>
                  </td>
                </tr>
              </tbody>
                <?php } ?>
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
