json.detail_siswa do
    json.id                 @student.id
    json.jenis_kelamin      @student.jenis_kelamin
    json.nisn               @student.nisn
    json.no_induk           @student.no_induk
    json.status_pendidikan  @student.status_pendidikan
    json.angkatan           @student.angkatan

    json.user do 
        json.id         @user.id
        json.email      @user.email
        json.peranan    @user.peranan
        json.token      @user.personal_token

    end

end