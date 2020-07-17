<div class="content-wrapper">
    <section class="content">
      <div class="container-fluid">
        <div class="row d-flex justify-content-center" >
          <!-- left column -->
          <div class="col-md-12" style="margin-top:2px ">
            <!-- general form elements -->
            <?php if ($this->session->flashdata('message')) { ?>
            <div class="alert alert-info" id="info"> <?= $this->session->flashdata('message') ?> </div>
            <?php } ?>
            <div class="card card-light">
              <div class="card-header d-flex justify-content-center">
                <h3 class="card-title"><strong><?php echo $judul;?></strong></h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <?php
                echo form_open_multipart($action, 'role="form" class="form-horizontal" name="siswa"');
              ?>
              <!--form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data"-->
                <div class="card-body">
                  <div class="row d-flex justify-content-center">
                    <div class="col-lg-8">
                      <table width="100%" id="mytable">

                    <tr>
                      <td>
                        <div class="form-group">
                          <label>NIS <?php echo form_error('nis') ?></label>
                        </div>
                      </td>
                      <td>
                        <div class="form-group">
                          <input type="text" class="form-control col-lg-12" placeholder="Siswa" name="nis" value="<?php echo $nis; ?>">
                        </div>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        <div class="form-group">
                          <label>Nama Siswa <?php echo form_error('namasiswa') ?></label>
                        </div>
                      </td>
                      <td>
                        <div class="form-group">
                          <input type="text" class="form-control col-lg-12" placeholder="Siswa" name="namasiswa" value="<?php echo $namasiswa; ?>">
                        </div>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        <div class="form-group">
                          <label>Kelas <?php echo form_error('kelas') ?></label>
                        </div>
                      </td>
                      <td>
                        <div class="form-group">
                          <select name="idkelas" class="form-control col-lg-4">
                            <?php
                            foreach ($kelas->result() as $row) {
                            ?>

                            <option  value="<?php echo $row->idkelas; ?>" <?php  echo $row->kelas == $idkelas?' selected':''; ?>>
                              <?php echo $row->kelas;?>
                            </option>
                            <?php
                            }
                            ?>
                          </select>
                        </div>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        <div class="form-group">
                          <label>Tahun Ajaran <?php echo form_error('tahunajaran') ?></label>
                        </div>
                      </td>
                      <td>
                        <div class="form-group">
                          <input type="text" class="form-control col-lg-12" placeholder="Tahun Ajaran" name="tahunajaran" value="<?php echo $tahunajaran; ?>">
                        </div>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        <div class="form-group">
                          <label>SPP <?php echo form_error('byrspp') ?></label>
                        </div>
                      </td>
                      <td>
                        <div class="form-group">
                          <input type="text" class="form-control col-lg-12" placeholder="SPP" name="byrspp" value="<?php echo $byrspp; ?>">
                        </div>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        <div class="form-group">
                          <label>Catering <?php echo form_error('byrcatering') ?></label>
                        </div>
                      </td>
                      <td>
                        <div class="form-group">
                          <input type="text" class="form-control col-lg-12" placeholder="Catering" name="byrcatering" value="<?php echo $byrcatering; ?>">
                        </div>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        <div class="form-group">
                          <label>Worksheet <?php echo form_error('byrworksheet') ?></label>
                        </div>
                      </td>
                      <td>
                        <div class="form-group">
                          <input type="text" class="form-control col-lg-12" placeholder="Worksheet" name="byrworksheet" value="<?php echo $byrworksheet; ?>">
                        </div>
                      </td>
                    </tr>

                  </table>
                    </div>
                  </div>

                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <input type="hidden" name="idsiswa" value="<?php echo $idsiswa; ?>" />
                  <button type="submit" class="btn btn-warning"><?php echo "$button"; ?></button>
                  <a href="<?php echo site_url('siswa') ?>" class="btn btn-success">Kembali</a></td></tr>
                </div>
              </form>

              <!--script>document.mhs.submit();</script-->
            </div>
            <!-- /.card -->

          </div>
          <!--/.col (left) -->
          <!-- right column -->

          <!--/.col (right) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>
